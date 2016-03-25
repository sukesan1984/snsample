class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    if current_user.nil?
      @posts = Post.find_public_posts.preload(:user)
    else
      @posts = Post.find_public_posts.preload(:user)
    end
  end

  def create
    @post = Post.new(
      user_id: current_user.id,
      comment: params[:post][:comment],
      restriction: params[:post][:restriction])
    @post.save!
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes_by_user_id(post_params, current_user.id)
    if @post.errors.empty?
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    else
      render 'edit'
    end
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy_by_user_id(current_user.id)
    if @post.errors.empty?
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end
  end

  private 
    def post_params
      params.require(:post).permit(:comment, :restriction)
    end
end

