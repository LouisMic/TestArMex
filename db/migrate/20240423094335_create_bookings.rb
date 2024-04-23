class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :performance, null: false, foreign_key: true
      t.date :booking_date
      t.string :channel
      t.string :type

      t.timestamps
    end
  end
end
