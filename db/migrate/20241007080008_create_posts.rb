class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.integer :tracking_id
      t.string :password_digest

      t.timestamps
    end
    add_index :posts, :tracking_id, unique: true
  end
end
