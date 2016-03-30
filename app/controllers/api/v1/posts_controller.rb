class Api::V1::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where('post_id = ?', @post.id).preload(:user)
    @data = @comments.map{ |comment| { author: "#{comment.user.last_name}#{comment.user.first_name}", text: "#{comment.comment}" } }
  end
end
