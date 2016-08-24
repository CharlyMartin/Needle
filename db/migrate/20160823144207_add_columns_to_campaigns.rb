class AddColumnsToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :status_private, :string
    add_column :campaigns, :status_public, :string
  end
end
