# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "We are creating restaurants and reviews"
puts "But let's destroy what we have first"
Restaurant.destroy_all
Review.destroy_all
puts "all destroyed!"

puts "Now creating new ones"

5.times do
  name = Faker::Name.unique.name
  address = Faker::Address.street_name
  phone_number = Faker::PhoneNumber.cell_phone
  my_array = %w(chinese italian japanese french belgian)
  category = my_array[rand(my_array.length)]
  restaurant = Restaurant.create(name: name, address: address, phone_number: phone_number, category: category)
  puts "restaurant created"
 2.times do
  content = Faker::Restaurant.review
  rating = rand(0..5)
  restaurant.reviews.create(content: content, rating: rating)
 end
  puts "review written"
end
