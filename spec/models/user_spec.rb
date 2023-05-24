require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should have sleep records' do
      user = create(:user)
      create(:sleep_record, user: user)

      expect(user.sleep_records.count).to eq(1)
    end
  end
end
