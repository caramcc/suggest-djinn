class Pair < ActiveRecord::Base

  class << self

    def create(item_1_id, item_2_id)
      pair = Pair.new(item_1_id: item_1_id, item_2_id: item_2_id)
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

      if found.last.nil?
        Pair.create(item_1_id, item_2_id)
      else
        if found.last.differential.nil?
          0
        else
          found.last.differential
        end
      end

    end
  end

end
