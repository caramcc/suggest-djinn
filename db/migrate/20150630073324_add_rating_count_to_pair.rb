class AddRatingCountToPair < ActiveRecord::Migration
  def change
    add_column :pairs, :ratings_count, :integer
  end
end
