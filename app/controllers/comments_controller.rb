class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(
      comment: params.require(:comment).permit(:comment)[:comment],
      user_id: current_user.id)
    redirect_to post_path(@post)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
end
