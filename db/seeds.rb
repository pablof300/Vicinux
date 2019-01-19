# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Appliances", icon: "appliances.png")
Category.create(name: "Cleaning", icon: "cleaning.png")
Category.create(name: "Food", icon: "food.png")
Category.create(name: "Electronics", icon: "electronics.png")
Category.create(name: "Furniture", icon: "furniture.png")
Category.create(name: "Other", icon: "misc.png")
Category.create(name: "Non-perishable", icon: "nonperishable.png")
