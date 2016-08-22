class CreateFollowings < ActiveRecord::Migration[5.0]
  def change
    create_table :followings do |t|
      t.references :designer
      t.references :follower

      t.timestamps
    end
  end
end
