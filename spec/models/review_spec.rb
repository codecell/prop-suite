require 'rails_helper'

RSpec.describe Review, type: :model do
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

  let(:review1) do
    user2.reviews.create(content: 'he\'s the best', reviewed_id: 1, rating: 'positive')
  end

  it 'belongs_to user' do
    expect(review1).to eq(user2.reviews.first)
  end
end
