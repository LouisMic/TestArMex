class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :performance
  has_many :tickets, dependent: :destroy

  validates :booking_date, presence: true
  validates :channel, inclusion: { in: %w(GUICHET DIGITICK) }
  validates :booking_type, inclusion: { in: ["Abonnement", "Place individuelle"] }

  def self.users
    Booking.all.map(&:user).uniq
  end

  def self.users_age
    Booking.users.reject{|buyer| buyer.age.nil? }.map(&:age)
  end
end
