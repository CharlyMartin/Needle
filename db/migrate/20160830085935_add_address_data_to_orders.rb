class AddAddressDataToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :address, :string
    add_column :orders, :further_details, :string
    add_column :orders, :zip_code, :integer
    add_column :orders, :city, :string
    add_column :orders, :country, :string
  end
end
