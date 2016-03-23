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
