class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @current_campaigns = @user.campaigns.where("date_end > ?", Date.today)
    @past_campaigns = @user.campaigns.where("date_end < ?", Date.today)
  end

end
