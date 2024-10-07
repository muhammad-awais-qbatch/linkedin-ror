class Endorsement < ApplicationRecord
  belongs_to :user
  belongs_to :user_skill, counter_cache: true
  # has_many :user_skills
  # belongs_to :skill
  # has_many :skills, through: :user_skills
  
  validates_uniqueness_of :user_id, scope: :user_skill_id
end
