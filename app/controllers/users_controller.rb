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
end
