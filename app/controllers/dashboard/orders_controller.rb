class Dashboard::OrdersController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @orders = Order.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @order = Order.where(state: 'paid').find(params[:id])
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @order = @campaign.orders.new(order_params)
    @order.user = current_user

    if @order.valid?
      @order.save
      if @campaign.success?
        @campaign.close!
      end
      redirect_to new_dashboard_order_payment_path(@order)
    else
      render 'campaigns/show'
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
    params.require(:order).permit([:item_size, :number_of_items, :delivery_address, :user_id, :campaign_id])
  end

end
