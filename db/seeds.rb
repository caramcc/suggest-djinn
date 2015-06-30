# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

###### TV SHOW SEEDS



caramcc = User.create(username: 'caramcc', password_digest: '$2a$10$t5KS6SG8xtkfwvF.Wtjd/uPpEwQMScX6Z4UBg1kzkaBK1ou2sr.o2')

caramcc.rate('Legos', 5)
caramcc.rate('Sandwiches', 5)
caramcc.rate('Twerking', 3)
caramcc.rate('Miley Cyrus', 5)
caramcc.rate('Avril Lavigne', 1)
caramcc.rate('Programming', 5)
caramcc.rate('Writing', 4)
caramcc.rate('NaNoWriMo', 4)
caramcc.rate('Tumblr', 2)
caramcc.rate('Reddit', 4)
caramcc.rate('Indie Folk', 5)
caramcc.rate('Country Music', 1)
caramcc.rate('Game of Thrones', 5)
caramcc.rate('A Song of Ice and Fire', 5)
caramcc.rate('Avatar: The Last Airbender', 5)
caramcc.rate('Netflix', 5)

notme = User.create(username: 'notcaramcc', password_digest: '$2a$10$t5KS6SG8xtkfwvF.Wtjd/uPpEwQMScX6Z4UBg1kzkaBK1ou2sr.o2')

notme.rate('Legos', 5)
notme.rate('The Lego Movie', 5)
notme.rate('Programming', 5)
notme.rate('Reddit', 4)
notme.rate('Indie Folk', 4)
notme.rate('Arcade Fire', 5)
notme.rate('The National', 5)
notme.rate("Grey's Anatomy", 4)
notme.rate('Skins', 5)
notme.rate('Master Chef', 4)
notme.rate('Dance Moms', 5)
notme.rate('Woodworking', 4)
notme.rate('Drawing', 3)

# notme.rank_item(2000, 4)
# notme.rank_item(1, 3)
# notme.rank_item(12, 4)
# notme.rank_item(15, 4)
# notme.rank_item(20, 5)
# notme.rank_item(18, 2)