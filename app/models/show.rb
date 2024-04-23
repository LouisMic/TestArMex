class Show < ApplicationRecord
  has_many :performances

  validates :name, presence: true
end
