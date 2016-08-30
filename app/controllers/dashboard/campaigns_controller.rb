class Dashboard::CampaignsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_campaign, only: [:show, :edit, :update]

  def index
    @campaigns = Campaign.where(user: current_user)
  end

  def show
    @order = Order.new
  end

  def new
    @campaign = Campaign.new
    @categories = Category.all
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)
    @categories = Category.all
    category = Category.find_by_name(params[:campaign][:cat][:cat])
    @campaign.category_id = category.id
    if @campaign.save
      redirect_to dashboard_campaigns_path(), notice: "Your campaign has been created !"
    else
      render :new
    end
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
    params.require(:campaign).permit(:title, :batch_size, :duration, :date_start, :date_end, :description, :spec, :price, :category, :gender, :cat, photos: [])
  end
end


