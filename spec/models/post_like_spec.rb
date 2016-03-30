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

require 'rails_helper'

RSpec.describe PostLike, type: :model do
  it 'is valid likes defferent post' do
    PostLike.create(
      user_id: 1,
      post_id: 1
    )

    post_like2 = PostLike.new(
      user_id: 1,
      post_id: 2
    )

    expect(post_like2).to be_valid
  end
  it 'is invalid duplicate likes for one post' do
    PostLike.create(
      user_id: 1,
      post_id: 1
    )

    post_like2 = PostLike.new(
      user_id: 1,
      post_id: 1
    )

    post_like2.valid?
    expect(post_like2.errors[:post_id]).to include("はすでに存在します")
  end


end
