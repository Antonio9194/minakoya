class AddAmenitiesToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :amenities, :text
  end
end
