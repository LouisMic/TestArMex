class User < ApplicationRecord
  has_many :bookings
  has_many :tickets, through: :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, inclusion: { in: ["H", "F"] }, :allow_nil => true
  validates :age, numericality: { only_integer: true }, :allow_nil => true
end
