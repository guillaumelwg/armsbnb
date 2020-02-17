class Weapon < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :price, :name, :category, :localisation, presence: true
end

bazooka = Weapon.new
bazooka.name = "bazooka"
bazooka.price = 2000
bazooka.category = "grosse armes"
bazooka.localisation = "paris 17"
bazooka.user = paul
