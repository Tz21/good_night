class SleepRecordsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    sleep_record = user.sleep_records.create!(sleep_record_params)
    render json: { sleep_record: sleep_record, all_records: user.sleep_records.order(:created_at) }
  end

  private

  def sleep_record_params
    params.require(:sleep_record).permit(:start_time, :end_time)
  end
end
