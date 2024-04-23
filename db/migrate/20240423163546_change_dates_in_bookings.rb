class ChangeDatesInBookings < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :booking_date, :datetime
  end
end
