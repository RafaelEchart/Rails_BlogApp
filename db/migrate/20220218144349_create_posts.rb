class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
    add_index :posts, :user_id
    add_foreign_key :posts, :users
  end
end
