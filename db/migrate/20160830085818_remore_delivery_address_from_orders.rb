class RemoreDeliveryAddressFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :delivery_address
  end
end
