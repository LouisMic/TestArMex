class Ticket < ApplicationRecord
  belongs_to :booking

  validates :price, numericality: true, presence: true

  enum status: {
    on_sale: 1,
    sold: 2
  }
end
