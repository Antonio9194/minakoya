class AddUserReferenceToContactMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :contact_messages, :user, null: false, foreign_key: true
  end
end
