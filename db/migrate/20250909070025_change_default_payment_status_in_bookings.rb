class ChangeDefaultPaymentStatusInBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_default :bookings, :payment_status, from: nil, to: "pending"
  end
end