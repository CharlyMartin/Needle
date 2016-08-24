class Dashboard::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @order = @campaign.orders.new(order_params)
    @order.user = current_user
    @order.save
    redirect_to dashboard_campaign_path(@campaign)
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    order = @campaign.orders.find_by_user_id(current_user.id)
    order.destroy
    redirect_to dashboard_campaign_path(@campaign)
  end

  private

  def order_params
    params.require(:order).permit([:item_size, :number_of_items, :delivery_address, :user_id, :campaign_id])
  end

end
