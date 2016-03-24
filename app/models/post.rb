# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  comment     :string(255)      not null
#  restriction :integer          not null
#  group_id    :integer          default("0"), not null
#  photo_id1   :integer          default("0"), not null
#  photo_id2   :integer          default("0"), not null
#  photo_id3   :integer          default("0"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
end