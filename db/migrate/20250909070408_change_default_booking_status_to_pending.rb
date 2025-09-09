class ChangeDefaultBookingStatusToPending < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :status, from: "confirmed", to: "pending"
  end
end