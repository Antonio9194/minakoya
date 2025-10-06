class Room < ApplicationRecord
  has_many :bookings

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

  def booked_dates
    bookings.upcoming.where(status: ["confirmed", "pending"]).map do |booking|
      {
        from: booking.start_date.to_s,
        to: (booking.end_date - 1).to_s
      }
    end
  end

end
