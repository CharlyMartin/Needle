class Dashboard::FollowingsController < ApplicationController

  def create
    @designer = User.find(params[:user_id])
    @following = @designer.followers.new
    @following.follower = current_user
    @following.save
    redirect_to  user_path(current_user)
  end

  def destroy
  end

end
