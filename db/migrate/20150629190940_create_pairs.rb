class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :item_1_id
      t.integer :item_2_id
      t.float :differential
      t.index [:item_1_id, :item_2_id]
      t.index [:item_2_id, :item_1_id]

      t.timestamps null: false
    end
  end
end
