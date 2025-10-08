class RemoveBedsFromRooms < ActiveRecord::Migration[7.1]
  def change
    remove_column :rooms, :beds, :integer
  end
end
