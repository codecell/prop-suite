require 'rails_helper'

RSpec.describe Search, type: :model do
  let(:a_search) do
    Search.create(address: '4 kings')
  end

  describe 'search functionality' do
    it 'creates a search data' do
      expect(a_search).not_to be_nil
    end
  end
end
