class AddRoomTypeToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :room_type, :string
  end
end
