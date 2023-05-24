FactoryBot.define do
  factory :sleep_record do
    user
    start_time { 1.hour.ago }
    end_time { Time.now }
  end
end
