require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #follow' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:params) { { id: user.id, other_user_id: other_user.id } }

    it 'adds the other user to the following list' do
      expect { post :follow, params: params }.to change { user.following.count }.by(1)
    end
  end

  describe 'DELETE #unfollow' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:params) { { id: user.id, other_user_id: other_user.id } }

    before do
      user.following << other_user
    end

    it 'removes the other user from the following list' do
      expect { delete :unfollow, params: params }.to change { user.following.count }.by(-1)
    end
  end

  describe 'GET #friends_sleep_records' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let!(:sleep_record) { create(:sleep_record, user: other_user, start_time: 2.days.ago, end_time: 1.day.ago) }

    before do
      user.following << other_user
    end

    it 'returns the sleep records of friends in the past week' do
      get :friends_sleep_records, params: { id: user.id }
      json = JSON.parse(response.body)
      expect(json.size).to eq(1)
      expect(json.first['sleep_records'].size).to eq(1)
    end
  end
end
