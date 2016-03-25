class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    if current_user.nil?
      @posts = Post.find_public_posts
    else
      @posts = Post.find_public_posts
    end
  end

  def create
    p params[:post]
    @post = Post.new(
      user_id: current_user.id,
      comment: params[:post][:comment],
      restriction: params[:post][:restriction])
    @post.save!
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end
end

