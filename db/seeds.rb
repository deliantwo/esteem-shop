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
Category.new(name: "RTS") 
Category.new(name: "RPG") 
Platform.create(name: "Steam")  
Platform.create(name: "Origin")  
Game.create(name: "Plague Inc", description: "Some descritpion", category: Category.find_by(name: "RTS"), publisher: Publisher.find_by(name: "Ndemic Creations"), producer: Producer.find_by(name: "Sun Games Interactive"))