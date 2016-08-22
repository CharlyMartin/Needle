class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.integer :batch_size
      t.datetime :date_start
      t.datetime :date_end
      t.text :description
      t.text :spec
      t.integer :price
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
