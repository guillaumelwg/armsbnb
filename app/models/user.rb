class User < ApplicationRecord
  has_many :weapons
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :username, :email, :password, uniqueness: true
  validates :password, presence: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
end

# paul = User.new
# paul.username = "polo"
# paul.email = "paul@gmail.com"
# paul.password ="password"

