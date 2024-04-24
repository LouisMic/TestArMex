class Show < ApplicationRecord
  has_many :performances
  has_many :bookings, through: :performances
  has_many :tickets, through: :bookings

  validates :name, presence: true

  def unique_bookings
    self.id ? self.bookings.uniq : Booking.all
  end

  def unique_tickets
    self.id ? self.tickets : Ticket.all
  end

  def buyers
    self.unique_bookings.map(&:user).uniq
  end

  def users_age
    defined_ages = self.buyers.reject{|buyer| buyer.age.nil? }.map(&:age)
    defined_ages.size == 0 ? "Pas d'âge rempli" : "#{defined_ages.inject(:+) / defined_ages.size} ans"
  end

  def avg_price
    self.unique_tickets.map(&:price).inject(:+).fdiv(self.unique_tickets.size).round(2)
  end
end
