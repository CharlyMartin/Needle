class AddPriceToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_monetize :campaigns, :price, currency: { present: false }
  end
end
