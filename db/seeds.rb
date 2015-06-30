# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

###### TV SHOW SEEDS



caramcc = User.create(username: 'caramcc', password_digest: '$2a$10$t5KS6SG8xtkfwvF.Wtjd/uPpEwQMScX6Z4UBg1kzkaBK1ou2sr.o2')

# caramcc.rank_item(2000, 5)
# caramcc.rank_item(1, 1)
# caramcc.rank_item(5, 5)
# caramcc.rank_item(12, 4)
# caramcc.rank_item(15, 3)


notme = User.create(username: 'notcaramcc', password_digest: '$2a$10$t5KS6SG8xtkfwvF.Wtjd/uPpEwQMScX6Z4UBg1kzkaBK1ou2sr.o2')


# notme.rank_item(2000, 4)
# notme.rank_item(1, 3)
# notme.rank_item(12, 4)
# notme.rank_item(15, 4)
# notme.rank_item(20, 5)
# notme.rank_item(18, 2)