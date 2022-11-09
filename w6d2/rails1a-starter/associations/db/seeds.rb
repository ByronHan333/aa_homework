# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  puts "Preparing #{Rails.env} environment"

  puts 'Destroying tables...'
  CartItem.destroy_all
  Cart.destroy_all
  Dish.destroy_all
  Review.destroy_all
  Restaurant.destroy_all
  User.destroy_all

  puts 'Resetting id sequences...'
  %w(users restaurants carts dishes reviews cart_items).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  puts 'Creating seed data...'
  randy = User.create(
    username: "randy",
    password: "bobandy"
  )

  donald = User.create(
    username: "donald",
    password: "mcronald"
  )

  burgers = Restaurant.create(
    name: "Bobandys Burgers",
    address: "1991 Sunnyvale blvd",
    owner_id: randy.id
  )

  other_rest = Restaurant.create(
    name: "McRonalds",
    address: "86 Hachiroku dr",
    owner_id: donald.id
  )

  cart = Cart.create(
    user_id: randy.id
  )

  dish = Dish.create(
    name: "Burrito Burger",
    description: "A burrito but also a burger",
    restaurant_id: burgers.id
  )

  review1 = Review.create(
    body: "Best restaurant in Nova Scotia.",
    rating: 5,
    user_id: donald.id,
    restaurant_id: burgers.id
  )

  review2 = Review.create(
    body: "I got sick from eating here.",
    rating: 1,
    user_id: randy.id,
    restaurant_id: other_rest.id
  )

  cart_item = CartItem.create(
    cart_id: cart.id,
    dish_id: dish.id
  )

  puts "Done with #{Rails.env} environment!"
end