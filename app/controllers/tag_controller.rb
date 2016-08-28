class TagController < ApplicationController

  def show
      @posts  = Post.where(tag: params[:tag]).order('created_at DESC').paginate(page: params[:page])
      if request.xhr?
        render partial: "post/posts_list"
      end
      # Is used as the user/posts url for listing the post of a user, not using using user controller for devise purposes.
    end

end
