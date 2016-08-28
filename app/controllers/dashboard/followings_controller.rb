class Dashboard::FollowingsController < ApplicationController

  def create
    @designer = User.find(params[:id])
    @following = @designer.followings.new
    @followings.follower = current_user
    @following.save
  end

  def destroy
  end

end
