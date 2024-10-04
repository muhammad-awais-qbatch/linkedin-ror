class CreateUserSkills < ActiveRecord::Migration[7.2]
  def change
    create_table :user_skills do |t|
      t.integer :endorsements_count, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
