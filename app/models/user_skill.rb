class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  has_many :endorsements, counter_cache: true
end
 