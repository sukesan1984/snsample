# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  last_name              :string(255)      not null
#  first_name             :string(255)      not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid with last_name over 20 lengths'  do
    user = User.new(
      last_name: 'abcdefghijklmnopqrstuxyiw',
      first_name: 'kosuke',
      email: 'test@test.com',
      password: 'password'
    )
    user.valid?
    expect(user.errors[:last_name]).to include("is too long (maximum is 20 characters)")
  end
end
