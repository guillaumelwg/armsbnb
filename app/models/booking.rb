class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :weapon
  has_many :reviews
  validates :bookingdate, presence: true
end

# # firstb = Booking.new
# firstb.bookingdate = "24/02/2019"
# firstb.weapon = bazooka
# firstb.user = User.first
