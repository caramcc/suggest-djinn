class Item < ActiveRecord::Base
  has_many :users, through: :rankings




  class << self

    def inefficient_unrated_items
      items = []
      ranked = []

      Item.all.each do |item|
        items.push item.id
      end

      Ranking.all.each do |rank|
        ranked.push rank.item_id
      end
      puts ranked

      items.to_a.reject! {|i| ranked.include? i }

    end


  end

end
