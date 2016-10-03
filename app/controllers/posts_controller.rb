class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).order('created_at ASC')
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "Post successfully created."
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, alert: "Post successfully deleted!"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end

