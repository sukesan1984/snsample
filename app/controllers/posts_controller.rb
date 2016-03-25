class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    if current_user.nil?
      @posts = Post.find_public_posts
    else
      @posts = Post.find_public_posts_and_user_id(current_user.id)
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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if !@post.self?(current_user.id)
      @post.errors.add :base, :cant_update_others_post
      render 'show'
      return
    end
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

