class AddGenderToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :gender, :string
  end
end
