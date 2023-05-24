class SleepRecord < ApplicationRecord
  belongs_to :user

  validates :start_time, :end_time, presence: true
  validate :end_after_start
  validate :time_within_one_month

  private

  def end_after_start
    errors.add(:end_time, "must be after the start time") if end_time <= start_time
  end

  def time_within_one_month
    errors.add(:start_time, "must be within the last month") if start_time < 1.month.ago
    errors.add(:end_time, "must be within the last month") if end_time < 1.month.ago
  end
end
