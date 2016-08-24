class AddColumnsToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :status_private, :integer, default: 0
    add_column :campaigns, :status_public, :integer
  end
end
