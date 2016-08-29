class CampaignsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @campaigns = Campaign.all
    @last_minute_campaigns = Campaign.ending_in_days(9).last(3)

  end

  def show
    @campaign = Campaign.find(params[:id])
    @order = Order.where(campaign: @campaign).find_by(user: current_user)
    # items_sold = 0
    # @campaign.orders.each do |order|
    # items_sold += order.number_of_items
    # end
    # @items_sold = items_sold

    @order = Order.new if @order.nil?
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.launch!
    redirect_to campaign_path(@campaign)
  end
end

