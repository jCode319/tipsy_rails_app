# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Review.destroy_all
Fav.destroy_all
CocktailBar.destroy_all

don = User.create(username: "Don", email: "Don@me.com", city: "Chicago", state: "IL", password_digest: 1234567899, favorite_cocktail: "Mojito")
lisa = User.create(username: "Lisa", email: "Lisa@me.com", city: "Chicago", state: "IL", password_digest: 9987654321, favorite_cocktail: "Cosmo")

rockbottom = CocktailBar.create(name: "Rock Bottom", address: "123 state street", rating: "3 stars")
barlouie = CocktailBar.create(name: "Bar Louie", address: "123 main street", rating: "4 stars")

rb_review = Review.create(content: "Bad service", rating: 1, user_id: 1, cocktail_bar_id: 1)
bl_review = Review.create(content: "Had a blast", rating: 5, user_id: 2, cocktail_bar_id: 2)

don_fav = Fav.create(user_id: 1, cocktail_bar_id: 2)
lisa_fav = Fav.create(user_id: 2, cocktail_bar_id: 1) 
