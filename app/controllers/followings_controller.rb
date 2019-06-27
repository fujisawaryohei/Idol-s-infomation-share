class FollowingsController < ApplicationController
  def create
    @user = User.find_by(hash_id: params[:hash_id])
    current_user.follow(@user)
    if current_user.following?(@user)
      respond_to do |format|
        format.js
      end
    else
      redirect_to "/users/result"
    end
  end

  def destroy
    @user = User.find_by(hash_id: params[:hash_id])
    current_user.unfollow(@user)
    if !current_user.following?(@user)
      respond_to do |format|
        format.js
      end
    else
      redirect_to "/users/result"
    end
  end
end
