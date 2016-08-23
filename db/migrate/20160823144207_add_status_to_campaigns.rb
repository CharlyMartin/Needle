class AddStatusToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :status, :string
  end
end
