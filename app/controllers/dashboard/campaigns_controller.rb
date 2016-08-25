class Dashboard::CampaignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_campaign, only: [:show, :edit, :update]

  def index
    @campaigns = Campaign.all
  end

  def show
    @order = Order.new
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)
    @campaign.save

    redirect_to dashboard_campaigns_path(), notice: "Your campaign has been created !"
  end

  def edit
  end

  def update

    @campaign.update(campaign_params)

   redirect_to dashboard_campaign_path(), notice: "Your campaign has been updated !"
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
     params.require(:campaign).permit(:title, :batch_size, :duration, :date_start, :date_end, :description, :spec, :price, :category, :gender, :photo)
  end

  # def campaign_update_params
  #   params.require(:campaign).permit(:title, :description, :spec, :category, :gender, :photo)
  # end
end
