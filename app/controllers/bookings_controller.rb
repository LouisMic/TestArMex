class BookingsController < ApplicationController
  def new
  end

  def import
    CsvImport.new(params[:file]).call
  end

  def index
    @bookings = Booking.all.size
    @buyers = Booking.users.size
    @median_age = Booking.users_age.inject(:+) / Booking.users_age.size
    @avg_price = Ticket.price.round(2)
  end
end
