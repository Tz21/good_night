class AddIndexToSleepRecords < ActiveRecord::Migration[7.0]
  def change
    add_index :sleep_records, [:user_id, :created_at]
  end
end
