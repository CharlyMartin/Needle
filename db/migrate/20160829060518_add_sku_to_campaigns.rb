class AddSkuToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :sku, :string
  end
end
