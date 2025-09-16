class Room < ApplicationRecord
  serialize :amenities, Array

  has_many :bookings
end
