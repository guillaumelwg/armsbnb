class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :weapon
  has_many :reviews
  validates :bookingdate, presence: true
end
