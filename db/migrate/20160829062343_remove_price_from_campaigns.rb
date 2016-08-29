class RemovePriceFromCampaigns < ActiveRecord::Migration[5.0]
  def change
    remove_column :campaigns, :price
  end
end
