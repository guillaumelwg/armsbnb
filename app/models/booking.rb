class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :weapon
  has_many :reviews, dependent: :destroy
  validates :bookingdate, presence: true
end
