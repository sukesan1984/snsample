class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :show, :edit]
  def index
  end

  def create

  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end
end
