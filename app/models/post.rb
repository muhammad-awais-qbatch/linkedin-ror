class Post < ApplicationRecord
  has_secure_password
  validates :title, presence: true, uniqueness: true, strict: true
end
