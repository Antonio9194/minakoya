class AddStripeFieldsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :stripe_payment_intent_id, :string
    add_column :bookings, :total_price_cents, :integer
  end
end
