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

FactoryGirl.define do
  factory :post_like do
    user_id 1
    post_id 1
  end
end
