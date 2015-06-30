class User < ActiveRecord::Base
  has_many :items, through: :rankings
  has_secure_password

  def rate(item_name, rating)
    item = Item.find_or_create_by(name: item_name)

    rate = Ranking.new(item_id: item.id, user_id: current_user.id, ranking: rating)
    rate.save

    Item.cascade(item.id, current_user.id, rating.to_i)
  end

  def inefficient_unrated_items
    items = []
    ranked = []

    Item.all.each do |item|
      items.push item.id
    end

    user_ranked = Ranking.where(user_id: self.id)

    user_ranked.each do |rank|
      ranked.push rank.item_id
    end

    items.to_a.reject! {|i| ranked.include? i }

    return items, ranked
  end




  def rank_item(item_id, rank)
    unranked_items, ranked_items = inefficient_unrated_items
    ranked_items.each do |i|

    end
    Ranking.create(user_id: self.id, item_id: item_id, ranking: rank)
  end


  def suggest(number)
    user_item_hash = {}

    unranked_items, ranked_items = inefficient_unrated_items
    ranked_count = ranked_items.size

    unranked_items.each do |item_id|
      running_avg = 0
      ranked_items.each do |ranked_id|
        pref_diff = Pair.average_diff(item_id, ranked_id)
        user_ranking = Ranking.where(:user_id => self.id, :item_id => ranked_id).first
        user_ranking.ranking ||= 0

        running_avg = pref_diff + user_ranking.ranking + running_avg
        running_avg /= ranked_count
      end
      user_item_hash[item_id] = running_avg
    end
    puts 'userhash'
    puts user_item_hash

    sorted_array = user_item_hash.sort_by { |k, v| v}.reverse

    output = ''

    (0..number).each do |i|
      unless sorted_array[i].nil?
        item = Item.find_by_id(sorted_array[i][0])
        output << item.name
        output << " [#{sorted_array[i]}]"
        output << "<br>"
      end

    end

    output
  end

end
