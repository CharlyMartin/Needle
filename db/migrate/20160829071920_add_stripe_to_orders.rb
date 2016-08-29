class AddStripeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :state, :string
    add_column :orders, :campaign_sku, :string
    add_column :orders, :amount, :monetize
    add_column :orders, :payment, :json
  end
end
