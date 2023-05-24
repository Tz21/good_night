require 'rails_helper'

RSpec.describe SleepRecord, type: :model do
  it 'is invalid if the end time is not after the start time' do
    record = build(:sleep_record, start_time: Time.now, end_time: 1.hour.ago)
    expect(record).to_not be_valid
  end

  it 'is invalid if the start time is more than a month ago' do
    record = build(:sleep_record, start_time: 2.months.ago)
    expect(record).to_not be_valid
  end

  it 'is invalid if the end time is more than a month ago' do
    record = build(:sleep_record, end_time: 2.months.ago)
    expect(record).to_not be_valid
  end
end
