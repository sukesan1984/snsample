class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @current_user = current_user
    @users = User.all.limit(20)
  end
end
