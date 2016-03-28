# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  post_id    :integer          not null
#  photo_id   :integer          default("0")
#  comment    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "isinvalid with no user_id" do
    comment = Comment.new(
      comment: "hoge",
      post_id: 1
    )

    comment.valid?
    expect(comment.errors[:user_id]).to include("を入力してください")
  end
end
