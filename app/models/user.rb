class User < ActiveRecord::Base
  has_many :items, through: :rankings


## When User u adds item:
# for every other Item i that u has ranked
# add the difference in u's preference for i and j to the i-j average


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
    puts ranked

    items.to_a.reject! {|i| ranked.include? i }

  end


  def rank_item(item_id, rank)
    Ranking.create(user_id: self.id, item_id: item_id, ranking: rank)
  end


  def suggest(number = 25)
    user_item_hash = {}

    # unranked_items = Item.joins('LEFT JOIN rankings ON rankings.item_id = item.id').
    #     where(rankings: { user_id: nil })
    unranked_items = Item.where(ranking: {item_id => nil})
    ranked_items = Ranking.where(:user_id => self.id)
    ranked_count = ranked_items.size

    unranked_items.each do |item|
      running_avg = 0
      ranked_items.each do |ranked|
        pref_diff = Pair.average_diff(item.id, ranked.id)
        user_raking = Ranking.where(:user_id => self.id, item.id => ranked.id).ranking
        running_avg += pref_diff + user_raking
      end
      user_item_hash[item.id] = running_avg
    end

    user_item_hash.sort_by { |k, v| v}

    (0..number).each do |i|
      puts user_item_hash[i]
    end
  end

end
