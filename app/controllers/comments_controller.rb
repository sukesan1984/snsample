class CommentsController < ApplicationController
  def index
  end

  def new
    @post_id = params[:post_id]
    @comment = Comment.new
  end
end
