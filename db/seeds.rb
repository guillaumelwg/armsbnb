# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

puts "Cleaning database"
Review.destroy_all
Booking.destroy_all
Weapon.destroy_all
User.destroy_all

puts "Seeding database"
puts "Creating users ..."
olivier = User.create!({email: "g.olivier.projet@gmail.com", password:'cjkdsbchdsb'})
paul = User.create!({email: "couzinet.paul@gmail.com", password:'hdczj1432'})
tom = User.create!({email: "tom@gmail.com", password:'kjshdczvbh12'})
guillaume = User.create!({email: "guillaumeprotard@gmail.com", password:'kjehfzc87341'})
puts "Created 4 users"
puts "------------------------------------------------------"

puts "Creating weapons"

file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582031964/hammer_m3pmr0.jpg')
hammer = Weapon.new({name: "Hammer", price: 50, category: "Household", localisation: "80 bd des Batignolles 75017 Paris"})
hammer.photo.attach(io: file, filename: '#{hammer.name}.jpg', content_type: 'image/jpg')
hammer.user = olivier
hammer.save!

file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582031964/plastic_duck_j7zmoe.jpg')
plastic_duck = Weapon.new({name: "Plastic duck", price: 20, category: "Household", localisation: "10 rue de la paix 75002 Paris"})
plastic_duck.photo.attach(io: file, filename: '#{plastic_duck.name}.jpg', content_type: 'image/jpg')
plastic_duck.user = olivier
plastic_duck.save!

file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582031964/uzi_wknm4y.jpg')
uzi = Weapon.new({name: "Uzi", price: 200, category: "Firearms", localisation: "10 rue de la paix 75002 Paris"})
uzi.photo.attach(io: file, filename: '#{uzi.name}.jpg', content_type: 'image/jpg')
uzi.user = olivier
uzi.save!

file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582031964/tomahawk_vysqg7.jpg')
tomahawk = Weapon.new({name: "Tomahawk", price: 150, category: "Ethnic", localisation: "10 rue des écoles 75005 Paris"})
tomahawk.photo.attach(io: file, filename: '#{tomahawk.name}.jpg', content_type: 'image/jpg')
tomahawk.user = tom
tomahawk.save!

file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582031964/kitchen_knife_vnl880.jpg')
kitchen_knife = Weapon.new({name: "Kitchen knife", price: 30, category: "Household", localisation: "2 rue Turgot 75009 Paris"})
kitchen_knife.photo.attach(io: file, filename: '#{kitchen_knife.name}.jpg', content_type: 'image/jpg')
kitchen_knife.user = tom
kitchen_knife.save!

file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582031965/slingshot_x8dzcj.jpg')
slingshot = Weapon.new({name: "Slingshot", price: 10, category: "Kids", localisation: "80 bd des Batignolles 75017 Paris"})
slingshot.photo.attach(io: file, filename: '#{slingshot.name}.jpg', content_type: 'image/jpg')
slingshot.user = paul
slingshot.save!

file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582031965/tomato_ol8v9r.jpg')
tomatoe = Weapon.new({name: "Tomatoe", price: 2, category: "Food", localisation: "80 bd des Batignolles 75017 Paris"})
tomatoe.photo.attach(io: file, filename: '#{tomatoe.name}.jpg', content_type: 'image/jpg')
tomatoe.user = guillaume
tomatoe.save!

file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582031964/water_pistol_qd7tgm.jpg')
water_pistol = Weapon.new({name: "Water pistol", price: 10, category: "Kids", localisation: "80 bd des Batignolles 75017 Paris"})
water_pistol.photo.attach(io: file, filename: '#{water_pistol.name}.jpg', content_type: 'image/jpg')
water_pistol.user = guillaume
water_pistol.save!

file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582031964/hunting_rifle_r6fsmv.jpg')
hunting_rifle = Weapon.new({name: "Hunting rifle", price: 10, category: "Kids", localisation: "80 bd des Batignolles 75017 Paris"})
hunting_rifle.photo.attach(io: file, filename: '#{hunting_rifle.name}.jpg', content_type: 'image/jpg')
hunting_rifle.user = paul
hunting_rifle.save!

puts "Created some weapons"
puts "------------------------------------------------------"

users = [paul, olivier, tom, guillaume]
weapons = [hammer, plastic_duck, uzi, tomahawk, kitchen_knife, slingshot, tomatoe, water_pistol, hunting_rifle]
ratings = (1..5).to_a

puts "Creating 10 bookings"
10.times do
  booking = Booking.new
  booking.user = users.sample
  booking.weapon = weapons.sample
  booking.bookingdate = Time.now
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


