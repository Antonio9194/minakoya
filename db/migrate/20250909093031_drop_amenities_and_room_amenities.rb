class DropAmenitiesAndRoomAmenities < ActiveRecord::Migration[7.1]
  def change
    drop_table :room_amenities
    drop_table :amenities
  end
end