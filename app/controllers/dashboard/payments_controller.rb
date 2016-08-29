class Dashboard::PaymentsController < ApplicationController

  before_action :set_order

  def new
    # @campaign = Campaign.find(params[:id])
    @user = current_user
  end

  def create
  @amount_cents = @order.campaign.price_cents

  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @amount_cents, # in cents
    description:  "Payment for your order #{@order.campaign_sku} for order #{@order.id}",
    currency:     'eur'
  )

  @order.update(payment: charge.to_json, state: 'paid')
  redirect_to dashboard_order_path(@order)

  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_dashboard_order_payment_path(@order)

  end

  private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
