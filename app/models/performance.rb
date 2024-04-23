class Performance < ApplicationRecord
  belongs_to :show
  has_many :bookings
  has_many :tickets, through: :bookings

  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :end_date, comparison: { greater_than: :start_date }
end
