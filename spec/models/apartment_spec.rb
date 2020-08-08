require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user2) do
    User.create(
      username: 'Tester2uz',
      email: 'test2@domain.com',
      fullname: 'test2 tester',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  let(:apartmentz) do
    user2.apartments.create(
      address: '4 kingz lagos',
      price: 200,
      category: 'self-contain'
    )
  end

  describe 'model' do 
    it 'creates a new apartment' do
      expect(apartmentz).to eq(user2.apartments.first)
    end
  end
end
