# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  photo_id   :integer
#  comment    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :comment do
    user_id 1
    post_id 1
    photo_id 1
    comment "MyText"
  end
end
