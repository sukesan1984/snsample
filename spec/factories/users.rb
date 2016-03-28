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
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :user do
    id 1
    last_name "suke"
    first_name "san"
    email "test@test.com"
    password "testtesttest"
  end

  factory :archer, class: User do
    id 2
    last_name "archer"
    first_name "san"
    email "archer@archer.com"
    password "archerarcherarcher"
  end

  factory :michael, class: User do
    id 3
    last_name "michael"
    first_name "san"
    email "michael@michael.com"
    password "michaelmichaelmichael"
  end
end
