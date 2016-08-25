class CampaignsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @order = Order.where(campaign: @campaign).find_by(user: current_user)
    @order = Order.new if @order.nil?
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.launch!
    redirect_to campaign_path(@campaign)
  end
end

