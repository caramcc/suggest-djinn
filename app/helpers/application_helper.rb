module ApplicationHelper

  def preprocess
    # for every item i
    #   2.  for every other item j
    #   3.   for every user u expressing preference for both i and j
    #   4.     add the difference in u’s preference for i and j to an average

    items = Items.all

    items.each do |i|
      items.each do |j|
        unless i == j
          users = User.where()
        end
      end
    end

  end
end
