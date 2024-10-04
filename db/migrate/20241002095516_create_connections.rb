class CreateConnections < ActiveRecord::Migration[7.2]
  def change
    create_table :connections do |t|
      t.bigint :sender_id
      t.bigint :reciever_id
      t.string :status

      t.timestamps
    end
  end
end
