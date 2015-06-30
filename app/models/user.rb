class User < ActiveRecord::Base
  has_many :items, through: :rankings
  has_secure_password



=begin

1. for every item i the user u expresses no preference for
2.  for every item j that user u expresses a preference for
3.   find the average preference difference between j and i
4.   add this diff to u’s preference value for j
5.   add this to a running average
6. return the top items, ranked by these averages


user_item_hash = {}
# for each item |i| that user u has not ranked
    running_avg = 0
    ranked_count = u.number_ranked
#   for each item |j| that u has ranked
#     average preference difference between j and i over all users
#     add this to u's preference for j
      running_avg += preference_diff + pref_for_j
    end
    user_item_hash[i.id] = running_avg
  end
  return top items ranked by these averages

=end

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
        user_raking = Ranking.where(:user_id => self.id, :item_id => ranked_id).first.ranking
        running_avg += pref_diff + user_raking
        running_avg /= ranked_count
      end
      user_item_hash[item_id] = running_avg
    end
    puts 'userhash'
    puts user_item_hash

    sorted_array = user_item_hash.sort_by { |k, v| v}

    output = ''

    (0..number).each do |i|
      output << sorted_array[i]
      output << "\n"
    end

    output
  end

end
