class AddWideDoubleToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :wide_double, :integer, default: 0
  end
end
