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
olivier = User.create!({email: "g.olivier.projet@gmail.com", password:'123456'})
paul = User.create!({email: "couzinet.paul@gmail.com", password:'123456', admin: true})
tom = User.create!({email: "tom@gmail.com", password:'123456'})
guillaume = User.create!({email: "guillaumeprotard@gmail.com", password:'123456', admin: true})
puts "Created 4 users"
puts "------------------------------------------------------"
puts "Creating weapons"
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295113/marteau_t9iap0.jpg')
hammer = Weapon.new({name: "Hammer", price: 50, category: "Household", localisation: "9 Place de la République, 75003 Paris"})
hammer.photo.attach(io: file, filename: '#{hammer.name}.jpg', content_type: 'image/jpg')
hammer.user = olivier
hammer.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295121/canard_hl6glp.png')
plastic_duck = Weapon.new({name: "Plastic duck", price: 20, category: "Household", localisation: "10 rue de la paix, 75002 Paris"})
plastic_duck.photo.attach(io: file, filename: '#{plastic_duck.name}.jpg', content_type: 'image/jpg')
plastic_duck.user = olivier
plastic_duck.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295113/uzi_agajjr.jpg')
uzi = Weapon.new({name: "Uzi", price: 200, category: "Firearms", localisation: "1 Boulevard de Belleville, 75011 Paris"})
uzi.photo.attach(io: file, filename: '#{uzi.name}.jpg', content_type: 'image/jpg')
uzi.user = olivier
uzi.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295114/tomahawk_vqmmvs.jpg')
tomahawk = Weapon.new({name: "Tomahawk", price: 150, category: "Ethnic", localisation: "10 rue des écoles, 75005 Paris"})
tomahawk.photo.attach(io: file, filename: '#{tomahawk.name}.jpg', content_type: 'image/jpg')
tomahawk.user = tom
tomahawk.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582296368/couteau-de-cuisine-universel-bois-exotique-acier-inox-12c27_ztg1vt.jpg')
kitchen_knife = Weapon.new({name: "Kitchen knife", price: 30, category: "Household", localisation: "2 rue Turgot, 75009 Paris"})
kitchen_knife.photo.attach(io: file, filename: '#{kitchen_knife.name}.jpg', content_type: 'image/jpg')
kitchen_knife.user = tom
kitchen_knife.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295113/lance_pierre_gpeql0.jpg')
slingshot = Weapon.new({name: "Slingshot", price: 10, category: "Kids", localisation: "80 bd des Batignolles, 75017 Paris"})
slingshot.photo.attach(io: file, filename: '#{slingshot.name}.jpg', content_type: 'image/jpg')
slingshot.user = paul
slingshot.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295116/tomate_ueo3nx.jpg')
tomatoe = Weapon.new({name: "Tomatoe", price: 2, category: "Food", localisation: "112 rue Oberkampf, 75011 Paris"})
tomatoe.photo.attach(io: file, filename: '#{tomatoe.name}.jpg', content_type: 'image/jpg')
tomatoe.user = guillaume
tomatoe.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295115/PISTOLET-A-EAU_gij9hl.jpg')
water_pistol = Weapon.new({name: "Water pistol", price: 10, category: "Kids", localisation: "12 rue du Morvan, 75011 Paris"})
water_pistol.photo.attach(io: file, filename: '#{water_pistol.name}.jpg', content_type: 'image/jpg')
water_pistol.user = guillaume
water_pistol.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295113/fusil_chasse_ffpvs7.jpg')
hunting_rifle = Weapon.new({name: "Hunting rifle", price: 10, category: "Firearms", localisation: "8 rue Saint-Sulpice, 75006 Paris"})
hunting_rifle.photo.attach(io: file, filename: '#{hunting_rifle.name}.jpg', content_type: 'image/jpg')
hunting_rifle.user = paul
hunting_rifle.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295120/zf1_cinquieme_element_viu8tx.jpg')
zf1 = Weapon.new({name: "ZF1", price: 100, category: "Movie", localisation: "50 rue de l'université, 75007 Paris"})
zf1.photo.attach(io: file, filename: '#{zf1.name}.jpg', content_type: 'image/jpg')
zf1.user = paul
zf1.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295116/noisy_cricket_xd0x10.jpg')
noisy_cricket = Weapon.new({name: "Noisy Cricket", price: 130, category: "Movie", localisation: "10 Rue Sextius Michel, 75015 Paris"})
noisy_cricket.photo.attach(io: file, filename: '#{noisy_cricket.name}.jpg', content_type: 'image/jpg')
noisy_cricket.user = olivier
noisy_cricket.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295115/mitraillette_mafia_cwosdc.jpg')
mafia_violon = Weapon.new({name: "Mafia violon", price: 45, category: "Mafia", localisation: "88 bis Avenue Parmentier, 75011 Paris"})
mafia_violon.photo.attach(io: file, filename: '#{mafia_violon.name}.jpg', content_type: 'image/jpg')
mafia_violon.user = paul
mafia_violon.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295115/fouet_indiana_ones_tnjgdn.jpg')
whip = Weapon.new({name: "Whip", price: 12, category: "Adventurer", localisation: "98 Boulevard Saint-Germain, 75005 Paris"})
whip.photo.attach(io: file, filename: '#{whip.name}.jpg', content_type: 'image/jpg')
whip.user = olivier
whip.save!
file = URI.open('https://res.cloudinary.com/dqyyujlp1/image/upload/v1582295115/sabre_laser_o5onnf.jpg')
lightsaber = Weapon.new({name: "Lightsaber", price: 145, category: "Movie", localisation: "1 Avenue Simon Bolivar, 75019 Paris"})
lightsaber.photo.attach(io: file, filename: '#{lightsaber.name}.jpg', content_type: 'image/jpg')
lightsaber.user = guillaume
lightsaber.save!
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
  booking.start_date = Time.now
  booking.end_date = booking.start_date + 2
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











