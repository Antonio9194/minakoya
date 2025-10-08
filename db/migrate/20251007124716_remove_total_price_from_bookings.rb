class RemoveTotalPriceFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :total_price, :integer
  end
end
