class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @campaigns = Campaign.all
    @past_campaigns = @user.campaigns.where("date_end < ?", Date.today).last(3)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end
end

