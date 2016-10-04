module ApplicationHelper
  def long_date(date)
    h date.strftime("%A %d %B %Y - %H:%M %p") rescue ''
  end

  # Produces -> 2009-01-26
  def medium_date(date)
    h date.strftime("%m/%d/%Y at %H:%M %p") rescue ''
  end

  # Produces -> 2009-01-26
  def short_date(date)
    h date.strftime("%Y-%m-%d") rescue ''
  end

  def plain_date(date)
    h date.strftime("%A - %b %d, %I:%M %p") rescue ''
  end

  def post_creator(post)
    poster = User.find(post.user_id)
    link_to "#{poster.username}", user_path(poster)
  end

  def comment_creator(comment)
    commenter = User.find(comment.user_id)
    link_to "#{commenter.username}", user_path(commenter)
  end

  def new_comment
    new_comment = Comment.new
  end

  def edit_post(post)
    if current_user.id == post.user_id
      link_to 'Edit', edit_post_path(post), class: "btn btn-default"
    end
  end

  def destroy_post(post)
    if current_user.id == post.user_id
      link_to 'Destroy', post, method: :delete, class: "btn btn-default", data: { confirm: 'Are you sure?' }
    end
  end

  def edit_comment(comment)
    if current_user.id == comment.user_id
      link_to "Edit", "#comment_edit_#{comment.id}", {'data-toggle' => 'collapse', 'class' => 'btn btn-default' }
    end
  end

  def destroy_comment(comment)
    if current_user.id == comment.user_id
      link_to "Delete", {controller: "comments", action: "destroy", id: comment.id}, class: "btn btn-default", confirm: "Are you sure?", method: :delete
    end
  end

  def download_json_profile(user)
    if current_user.id == user.id
      link_to "Download", download_user_path(@user), method: :post
    end
  end
end
