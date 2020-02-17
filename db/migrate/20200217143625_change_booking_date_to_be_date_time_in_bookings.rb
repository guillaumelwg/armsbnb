class ChangeBookingDateToBeDateTimeInBookings < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :bookingdate, :datetime
  end
end
