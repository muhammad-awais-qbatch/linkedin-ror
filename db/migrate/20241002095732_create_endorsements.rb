class CreateEndorsements < ActiveRecord::Migration[7.2]
  def change
    create_table :endorsements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
