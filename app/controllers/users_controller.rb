class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
  end

  def download
    if @user.id == current_user.id
      send_data @user.to_json(root: true, include: [:posts, :comments]), :type => 'application/json; header=present', :disposition => "attachment; filename=users.json"
      flash[:notice] = "JSON file successfully downloaded"
    else
      redirect_to :back, notice: "Not authorized to download this file"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
