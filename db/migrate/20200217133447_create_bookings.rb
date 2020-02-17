class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :bookingdate
      t.references :user, null: false, foreign_key: true
      t.references :weapon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
