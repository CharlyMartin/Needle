class Dashboard::OrdersController < ApplicationController
  before_action :find_campaign, only: [ :create ]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = @campaign.orders.new(order_params)
    @order.user = current_user
    @order.save
    redirect_to dashboard_campaign_path(@campaign)
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit([:item_size, :number_of_items, :delivery_address, :user_id, :campaign_id])
  end

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
