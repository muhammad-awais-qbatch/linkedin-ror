class User < ApplicationRecord


  after_initialize do |user|
    Rails.logger.info("You have initialized an object!")
  end

  after_find do |user|
    Rails.logger.info("You have found an object!")
  end

  has_secure_password
  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :sender_connections, class_name: 'Connection', foreign_key: 'sender_id', inverse_of: :sender, dependent: :destroy
  has_many :reciever_connections, class_name: 'Connection', foreign_key: 'reciever_id', inverse_of: :reciever, dependent: :destroy 
  has_many :recievers, through: :sender_connections, source: :reciever
  has_many :senders, through: :reciever_connections, source: :sender

  validates :username, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password_digest, presence: true
end
