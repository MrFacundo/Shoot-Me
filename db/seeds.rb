# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(first_name: "Hans", last_name: "Wurst", email: "hans@web.de", password: "123456")

User.create(first_name: "Jane", last_name: "Doe", email: "jane@mail.com", password: "123456")

User.create(first_name: "Louis", last_name: "XIV", email: "sun@king.fr", password: "123456")




Location.create(name: "Beautiful House Boat", address: "Berlin", description: "One room house boat on the Spree with gorgeous view of Warschauer Brücke", daily_fee: 300, style: "Flat", user_id: 1)

Location.create(name: "Loft in Wedding", address: "Berlin", description: "Big loft in old warehouse complex in Wedding", daily_fee: 2000, style: "Flat", user_id: 3)

Location.create(name: "Private stage", address: "Köln", description: "Practice stage in amateur theatre", daily_fee: 300, style: "Theatre", user_id: 2)

Location.create(name: "Private stage", address: "Köln", description: "Practice stage in amateur theatre", daily_fee: 300, style: "Theatre", user_id: 2)
