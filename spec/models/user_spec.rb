require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }

  let(:user1) do
    User.create(
      username: 'johndoz',
      fullname: 'john doe',
      email: 'doe@domain.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  let(:user2) do
    User.create(
      username: 'janedoz',
      fullname: 'jane doe',
      email: 'jane@domain.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  let(:apartment1) do
    user1.apartments.create(address: '4 kings', price: 4000, category: 'mini-flat')
  end

  describe 'Model' do
    it 'should exist' do
      expect(user).not_to be_nil
    end
  end

  describe 'check apartments association association' do
    it 'creates an apartment' do
      user1.apartments.create(address: '8 gings', price: 5000, category: 'mini-flat')
      expect(user1.apartments.first).not_to be_nil
    end
  end

  describe 'check reviews association' do
    it 'creates a review' do
      user2.followings.create(followed_id: 1)
      expect(user2.followings).not_to be_nil
    end
  end

  describe 'check reviews association' do
    it 'creates a review' do
      user2.reviews.create(reviewed_id: 1, content: 'nice', rating: 'positive')
      expect(user2.reviews).not_to be_nil
    end
  end
end
