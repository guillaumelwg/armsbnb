# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database"
Review.destroy_all
Booking.destroy_all
Weapon.destroy_all
User.destroy_all

puts "Seeding database"
puts "Creating users ..."
olivier = User.create!({username: "Olivier", email: "g.olivier.projet@gmail.com", password:'cjkdsbchdsb'})
paul = User.create!({username: "Paul", email: "couzinet.paul@gmail.com", password:'hdczj1432'})
tom = User.create!({username: "Tom", email: "tom@gmail.com", password:'kjshdczvbh12'})
guillaume = User.create!({username: "Guillaume", email: "guillaumeprotard@gmail.com", password:'kjehfzc87341'})
puts "Created 4 users"
puts "------------------------------------------------------"

puts "Creating weapons"
hammer = Weapon.new({name: "Hammer", price: 50, category: "Household", localisation: "80 bd des Batignolles 75017 Paris"})
hammer.user = olivier
hammer.save!
plastic_duck = Weapon.new({name: "Plastic duck", price: 20, category: "Household", localisation: "10 rue de la paix 75002 Paris"})
plastic_duck.user = olivier
plastic_duck.save!
uzi = Weapon.new({name: "Uzi", price: 200, category: "Firearms", localisation: "10 rue de la paix 75002 Paris"})
uzi.user = olivier
uzi.save!
tomahawk = Weapon.new({name: "Tomahawk", price: 150, category: "Ethnic", localisation: "10 rue des écoles 75005 Paris"})
tomahawk.user = tom
tomahawk.save!
kitchen_knife = Weapon.new({name: "Kitchen knife", price: 30, category: "Household", localisation: "2 rue Turgot 75009 Paris"})
kitchen_knife.user = tom
kitchen_knife.save!
water_balloon = Weapon.new({name: "Water balloon", price: 5, category: "Kids", localisation: "80 bd des Batignolles 75017 Paris"})
water_balloon.user = paul
water_balloon.save!
slingshot = Weapon.new({name: "Slingshot", price: 10, category: "Kids", localisation: "80 bd des Batignolles 75017 Paris"})
slingshot.user = paul
slingshot.save!
tomatoe = Weapon.new({name: "Tomatoe", price: 2, category: "Food", localisation: "10 rue des martyrs 75009 Paris"})
tomatoe.user = guillaume
tomatoe.save!
water_pistol = Weapon.new({name: "Water pistol", price: 10, category: "Kids", localisation: "10 rue des martyrs 75009 Paris"})
water_pistol.user = guillaume
water_pistol.save!
hunting_rifle = Weapon.new({name: "Hunting rifle", price: 10, category: "Kids", localisation: "80 bd des Batignolles 75017 Paris"})
hunting_rifle.user = paul
hunting_rifle.save!
puts "Created some weapons"
puts "------------------------------------------------------"

users = [paul, olivier, tom, guillaume]
weapons = [hammer, plastic_duck, uzi, tomahawk, kitchen_knife, water_balloon, slingshot, tomatoe, water_pistol, hunting_rifle]
ratings = (1..5).to_a

puts "Creating 10 bookings"
10.times do
  booking = Booking.new
  booking.user = users.sample
  booking.weapon = weapons.sample
  booking.save!
end
puts "Created bookings"
puts "------------------------------------------------------"

puts "Creating 10 reviews"
booking_ids = (Booking.first.id..Booking.last.id).to_a
10.times do
  review = Review.new
  review.content = Faker::Lorem.paragraph
  review.rating = ratings.sample
  review.booking = Booking.find(booking_ids.first)
  booking_ids.delete_at(0)
  review.save!
end
puts "Created reviews"
puts "------------------------------------------------------"
