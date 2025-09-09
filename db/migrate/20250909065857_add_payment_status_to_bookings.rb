class AddPaymentStatusToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :payment_status, :string, default: "pending"
  end
end