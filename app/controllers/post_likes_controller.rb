class PostLikesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    post_id = params[:post_id]
    post = Post.find(post_id)
    if current_user.like?(post)
      raise 'already like'
    else
      current_user.like(post)
    end
    redirect_to '/posts'
  end

  def destroy
    post_id = params[:post_id]
    post = Post.find(post_id)
    if current_user.like?(post)
      current_user.unlike(post)
    else
      raise 'not like this post'
    end
    redirect_to '/posts'
  end
end
