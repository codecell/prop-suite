require 'rails_helper'

RSpec.describe Following, type: :model do
  let(:user1) do
    User.create(
      username: 'Test',
      email: 'test@domain.com',
      fullname: 'test tester',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  let(:user2) do
    User.create(
      username: 'Tester2uz',
      email: 'test2@domain.com',
      fullname: 'test2 tester',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  let(:following1) do
    user2.followings.create(followed_id: 1)
  end

  it 'belongs_to user' do
    expect(following1).to eq(user2.followings.first)
  end
end
