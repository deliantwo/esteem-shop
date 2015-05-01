# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Publisher.create(name: "Iceberg Interactive")
Publisher.create(name: "Ndemic Creations")
Producer.create(name: "Ndemic Creations")   
Producer.create(name: "Sun Games Interactive")
Category.create(name: "RTS") 
Category.create(name: "RPG") 
Platform.create(name: "Steam")  
Platform.create(name: "Origin")  
Game.create(name: "Plague Inc", description: "Some descritpion", category: Category.find_by(name: "RTS"), publisher: Publisher.find_by(name: "Ndemic Creations"), producer: Producer.find_by(name: "Sun Games Interactive"))
Game.create(name: "Totally not GTAV", description: "Some descritpion2", category: Category.find_by(name: "RPG"), publisher: Publisher.find_by(name: "Ndemic Creations"), producer: Producer.find_by(name: "Ndemic Creations"))
PricePlatformGame.create(price: 70, platform: Platform.find_by(name: "Steam"), game: Game.find_by(name: "Plague Inc"))
PricePlatformGame.create(price: 80, platform: Platform.find_by(name: "Origin"), game: Game.find_by(name: "Plague Inc"))
PricePlatformGame.create(price: 100, platform: Platform.find_by(name: "Steam"), game: Game.find_by(name: "Totally not GTAV"))
Gamekey.create(content: "XXXXXXXXXXX1", price_platform_game: PricePlatformGame.find_by(game: Game.find_by(name: "Plague Inc"), platform: Platform.find_by(name: "Steam")))
Gamekey.create(content: "XXXXXXXXXXX2", price_platform_game: PricePlatformGame.find_by(game: Game.find_by(name: "Plague Inc"), platform: Platform.find_by(name: "Steam")))
vat_23 = Vat.create(value: 23)

test_user = User.new
test_user.email = 'user@user.pl'
test_user.password = '123456789'
test_user.password_confirmation = '123456789'
test_user.save!

tu_game_key = Gamekey.create(user: test_user, content: "XXXXXXXXXXX3", price_platform_game: PricePlatformGame.find_by(game: Game.find_by(name: "Plague Inc"), platform: Platform.find_by(name: "Steam")))
test_purchase = Purchase.create(status: 1, user: test_user)
SoldProduct.create(gamekey: tu_game_key, vat: vat_23, price: 99.36, purchase: test_purchase) 
