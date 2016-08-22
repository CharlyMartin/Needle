class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.integer :batch_size
      t.date :date_start
      t.date :date_end
      t.text :spec
      t.integer :price
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
