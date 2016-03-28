class RelationshipsController < ApplicationController

  def create
    @target_user = User.find(params[:user_id])
    if @target_user.id == current_user.id
      raise 'cant follow myself'
    end
    if current_user.following?(@target_user)
      raise 'already followed'
    else
      current_user.follow(@target_user)
    end
  end

  # 対象のUserをunfollowする
  def destroy
    @target_user = User.find(params[:user_id])
    if current_user.following?(@target_user)
      current_user.unfollow(@target_user)
    else
      raise 'not following'
    end
  end
end
