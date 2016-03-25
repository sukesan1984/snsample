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

class Post < ActiveRecord::Base
  validates :user_id, presence: true
  VALID_RESTRICTION_REGEX = /\A0|1|2\z/i
  validates :restriction, presence: true, format: { with: VALID_RESTRICTION_REGEX }
  enum restriction_status: { public_post: 0, follower_only: 1, self_only: 2 } 

  MAX_POSTS_FOR_ONE_PAGE = 20

  # 全体公開されているpostを新しい順に取得
  def self.find_public_posts
    posts = Post.where("restriction = ?", Post.restriction_statuses[:public_post]).order(created_at: :desc).limit(MAX_POSTS_FOR_ONE_PAGE)
    return posts
  end
end
