class AssociateUsersToConnections < ActiveRecord::Migration[7.2]
  def up
    add_foreign_key :connections, :users, column: :sender_id, null: false
    add_foreign_key :connections, :users, column: :reciever_id, null: false
  end

  def down
    remove_foreign_key :connections, column: :sender_id
    remove_foreign_key :connections, column: :reciever_id
  end
end
