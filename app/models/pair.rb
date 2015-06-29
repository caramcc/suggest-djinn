class Pair < ActiveRecord::Base

  class << self

    def create(item_1_id, item_2_id)
      pair = Pair.new(item_1_id, item_2_id)
      pair.save

      # return
      0
    end


    def average_diff(item_1_id, item_2_id)
      # item 1 id should always be less than item 2 id, if not, switch them
      if item_1_id > item_2_id
        temp = item_1_id
        item_1_id = item_2_id
        item_2_id = temp
      end

      found = Pair.where(:item_1_id => item_1_id, :item_2_id => item_2_id)

      if found.nil?
        return Pair.create(item_1_id, item_2_id)
      else
        found = found.last
      end

      found.differential

    end
  end

end
