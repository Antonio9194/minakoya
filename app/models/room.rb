class Room < ApplicationRecord

  has_many :bookings

  monetize :price_per_night_cents, with_currency: :jpy

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_night, presence: true, numericality: {
    only_integer: true,
    greater_than: 0,
    message: "must be more than 0"
  }
  validates :size, presence: true, numericality: {
    only_integer: true,
    greater_than: 0,
    message: "must be more than 0"
  }
  validates :beds, presence: true, numericality: {
    only_integer: true,
    greater_than: 0,
    message: "must be more than 0"
  }
  validates :capacity, presence: true, numericality: {
    only_integer: true,
    greater_than: 0,
    message: "must be more than 0"
  }
  validates :amenities, presence: true
end
