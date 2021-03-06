class Dashboard::OrdersController < ApplicationController

  def index
    @orders = current_user.orders.where(state: 'paid')
  end

  def show
    @campaign = Campaign.find(params[:id])
    @order = Order.where(state: 'paid').find(params[:id])
  end

  def new
     @campaign = Campaign.find(params[:campaign_id])
     @order = Order.where(campaign: @campaign).find_by(user: current_user)
     @order = Order.new if @order.nil?
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @order = @campaign.orders.new(order_params)
    @order.item_size = order_params[:item_size].join(", ")
    @order.user = current_user
    if @order.valid?
      @order.save
      redirect_to new_dashboard_order_payment_path(@order)
    else
      render 'new'
    end
  end

  def destroy
    order = Order.find(params[:id])
    campaign = order.campaign
    order.destroy
    redirect_to campaign_path(campaign)
  end

  private

  def order_params
    params.require(:order).permit(:number_of_items, :address,
      :further_details, :zip_code, :city, :country, :user_id, :campaign_id, item_size:[])
  end
end
