class CampaignsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @campaigns = Campaign.all
    # @last_minute_campaigns = Campaign.ending_in_days(9).last(3)
    @campaigns_trends = Campaign.items_ordered(100)
    @categories = Category.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @active_price = @campaign.price * 0.4
    @production_price = @campaign.price * 0.7
    @order = Order.where(campaign: @campaign).find_by(user: current_user)
    @order = Order.new if @order.nil?
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.launch!
    redirect_to campaign_path(@campaign)
  end
end

