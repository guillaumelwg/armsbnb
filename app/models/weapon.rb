class Weapon < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :price, :name, :category, :localisation, presence: true
end
