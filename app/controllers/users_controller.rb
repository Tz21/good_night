class UsersController < ApplicationController
  def follow
    user = User.find(params[:id])
    other_user = User.find(params[:other_user_id])
    user.following << other_user unless user.following?(other_user) || user == other_user
    render json: { following: user.following }
  end

  def unfollow
    user = User.find(params[:id])
    other_user = User.find(params[:other_user_id])
    user.following.delete(other_user)
    render json: { following: user.following }
  end

  def friends_sleep_records
    user = User.includes(following: { sleep_records: :user }).find(params[:id])
    records = user.following.map do |friend|
      {
        name: friend.name,
        sleep_records: friend.sleep_records.where('start_time >= ?', 1.week.ago)
      }
    end
    records.sort_by! { |record| record[:sleep_records].sum { |r| r.end_time - r.start_time } }
    render json: records
  end
end
