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

require 'rails_helper'

RSpec.describe Post, type: :model do
  [0,1,2].each do |restriction|
    it "is valid with restriction:#{restriction}" do
      post = Post.new(
        user_id: 1,
        comment: "hoge",
        restriction: restriction
      )
      expect(post).to be_valid
    end
  end
  it "is invalid with restriction: 3" do
    post = Post.new(
      user_id: 1,
      comment: "hoge",
      restriction: 3
    )
    post.valid?
    expect(post.errors[:restriction]).to include("は不正な値です")
  end

  it 'can be destroyed by my self' do
    post = Post.new(
      user_id: 1,
      comment: "hoge",
      restriction: 0
    )
    post.destroy_by_user_id(1)
    expect(post).to be_valid
  end

  it 'cant be destroyed by others' do
    post = Post.new(
      user_id: 1,
      comment: "hoge",
      restriction: 0
    )
    post.destroy_by_user_id(2)
    expect(post.errors[:base]).to include("自身の投稿のみが削除できます")
  end
end
