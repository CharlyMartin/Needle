class AddCategoryToCampaign < ActiveRecord::Migration[5.0]
  def change
    add_reference :campaigns, :category, foreign_key: true
  end
end
