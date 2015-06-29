class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
