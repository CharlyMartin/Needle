class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @campaigns = @user.campaigns
    @followers = @user.followers

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end
end


