class AddSenderToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :sender_id, :integer
    add_column :messages, :recepient_id, :integer
  end
end
