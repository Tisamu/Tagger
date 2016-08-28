class PostController < ApplicationController

  def new
    @posts  = Post.order('created_at DESC').paginate(page: params[:page])
    if request.xhr?
      render partial: "posts_list"
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if !@post.save
      redirect_to root_path, flash: {danger: "Erreur"}
    else
      redirect_to root_path, flash: {notice: "Posté !"}
    end
  end

  def show
    @posts  = Post.where(user: User.find_by(username: params[:username])).order('created_at DESC').paginate(page: params[:page])
    if request.xhr?
      render partial: "posts_list"
    end
    # Is used as the user/posts url for listing the post of a user, not using using user controller for devise purposes.
  end

  def delete
    Post.find(params[:post]).delete
    redirect_back(fallback_location: root_path)
  end

  def post_params
    params.require(:post).permit(:message, :tag, :picture)
  end

end