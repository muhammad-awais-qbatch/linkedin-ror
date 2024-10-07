class Connection < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id', inverse_of: :sender_connections
  belongs_to :reciever, class_name: 'User', foreign_key: 'reciever_id', inverse_of: :reciever_connections

  validates_uniqueness_of :sender_id, scope: :reciever_id
end
