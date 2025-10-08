class AddBedTypesToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :bunk, :integer, default: 0
    add_column :rooms, :single, :integer, default: 0
    add_column :rooms, :semi_double, :integer, default: 0
    add_column :rooms, :double, :integer, default: 0
    add_column :rooms, :sofa_bed, :integer, default: 0
  end
end
