# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  comment     :text(65535)      not null
#  restriction :integer          not null
#  group_id    :integer          default("0"), not null
#  photo_id1   :integer          default("0"), not null
#  photo_id2   :integer          default("0"), not null
#  photo_id3   :integer          default("0"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_posts_on_restriction             (restriction)
#  index_posts_on_user_id_and_created_at  (user_id,created_at)
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :user_id, presence: true
  VALID_RESTRICTION_REGEX = /\A0|1|2\z/i
  validates :restriction, presence: true, format: { with: VALID_RESTRICTION_REGEX }
  enum restriction_status: { public_post: 0, follower_only: 1, self_only: 2 } 
  MAX_POSTS_FOR_ONE_PAGE = 20

  def self?(user_id)
    return self.user_id == user_id
  end

  def update_attributes_by_user_id(post_params, user_id)
    if self?(user_id)
      self.update_attributes(post_params)
    else
      errors.add :base, :cant_update_others_post
    end
    return self
  end

  def destroy_by_user_id(user_id)
    if self?(user_id)
      destroy!
    else
      errors.add :base, :cant_destroy_others_post
    end
    return self
  end

  # 全体公開されているpost
  def self.find_public_posts
    posts = Post.where("restriction = ?", Post.restriction_statuses[:public_post]).order(created_at: :desc).limit(MAX_POSTS_FOR_ONE_PAGE).preload(:user)
    return posts
  end

  # 全体公開されているpostと自身の投稿を新しい順に取得
  def self.find_public_posts_and_user_id(user_id)
    posts = Post.all.order(created_at: :desc).limit(MAX_POSTS_FOR_ONE_PAGE).preload(:user)
    filtered_posts = posts.select { |post| post.restriction == restriction_statuses[:public_post] || post.user_id == user_id }
    return filtered_posts
  end

  # 特定のユーザーのフォロワー・全体公開の投稿を新しい順に取得
  def self.find_public_posts_by_user_ids(user_ids)
    posts = Post.where('user_id in (?)', user_ids).from("posts force index(index_posts_on_user_id_and_created_at)").order(created_at: :desc).limit(MAX_POSTS_FOR_ONE_PAGE).preload(:user)
    filtered_posts = posts.select { |post| post.restriction != restriction_statuses[:self_only] }
    return filtered_posts
  end
end
