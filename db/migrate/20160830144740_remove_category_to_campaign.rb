class RemoveCategoryToCampaign < ActiveRecord::Migration[5.0]
  def change
    remove_column :campaigns, :category
  end
end
