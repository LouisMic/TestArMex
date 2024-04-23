class RenameBookingType < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :type, :booking_type
  end
end
