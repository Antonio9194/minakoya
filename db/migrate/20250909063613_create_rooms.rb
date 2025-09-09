class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :price_per_night
      t.integer :size
      t.integer :beds
      t.integer :capacity

      t.timestamps
    end
  end
end
