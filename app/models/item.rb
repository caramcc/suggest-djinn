class Item < ActiveRecord::Base
  has_and_belongs_to_many :users




  class << self

    def not_connected_to(user)
      where(<<-SQL, user.id)
        NOT EXISTS (SELECT 1
          FROM   items_users
          WHERE  item.id = items_users.item_id
          AND items_users.user_id = ?
          )
      SQL
    end
  end

end
