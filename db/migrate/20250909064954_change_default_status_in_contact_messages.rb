class ChangeDefaultStatusInContactMessages < ActiveRecord::Migration[7.1]
  def change
    change_column_default :contact_messages, :status, from: "pending", to: "confirmed"
  end
end
