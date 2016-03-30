# == Schema Information
#
# Table name: post_likes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :post_id, uniqueness: { scope: [:user_id] }
end
