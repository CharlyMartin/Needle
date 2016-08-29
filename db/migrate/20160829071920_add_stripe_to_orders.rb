class AddStripeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :state, :string, default: 'pending'
    add_column :orders, :campaign_sku, :string
    add_monetize :orders, :amount, currency: { present: false }
    add_column :orders, :payment, :json
  end
end
