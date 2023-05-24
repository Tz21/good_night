require 'rails_helper'

RSpec.describe SleepRecordsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:params) { { user_id: user.id, sleep_record: { start_time: 1.hour.ago, end_time: Time.now } } }

    it 'creates a new sleep record' do
      expect { post :create, params: params }.to change(SleepRecord, :count).by(1)
    end

    it 'returns the newly created sleep record and all sleep records of the user' do
      post :create, params: params
      json = JSON.parse(response.body)
      expect(json['sleep_record']['start_time']).to_not be_nil
      expect(json['all_records'].size).to eq(1)
    end
  end
end
