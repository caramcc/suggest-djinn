class Item < ActiveRecord::Base
  has_many :users, through: :rankings


  ## When User u adds item:
  # for every other Item i that u has ranked
  # add the difference in u's preference for i and j to the i-j average


  class << self

    def cascade(item_id, user_id, rating)
      unranked_items, ranked_items = User.find_by_id(user_id).inefficient_unrated_items

      ranked_items.each do |ranked|
        if ranked.id < item_id
          ij = Pair.find_by_params(item_1_id: ranked.id, item_2_id: item_id)
        else
          ij = Pair.find_by_params(item_1_id: item_id, item_2_id: ranked.id)
        end

        if ij.nil?
          ij = Pair.create(ranked.id, item_id)
        end

        diff = ij.differential * ij.ratings_count + rating
        ij.ratings_count += 1
        ij.differential = diff / ij.ratings_count

        ij.save
      end
      
    end


  end

end
