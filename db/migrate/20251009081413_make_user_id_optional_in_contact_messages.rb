class MakeUserIdOptionalInContactMessages < ActiveRecord::Migration[7.1]
  def change
     change_column_null :contact_messages, :user_id, true
  end
end
