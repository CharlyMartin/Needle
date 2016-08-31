class FollowingsController < ApplicationController

  def create
    @designer = User.find(params[:user_id])
    @following = @designer.followers.new
    @following.follower = current_user
    @following.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @following = Following.find(params[:id])
    @following.destroy
    respond_to do |format|
      format.js
    end
  end

end
