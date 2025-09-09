class AddStatusToContactMessages < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :status, from: "pending", to: "confirmed"
  end
end
