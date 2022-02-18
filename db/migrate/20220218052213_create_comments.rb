class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :posts, foreign_key: true, index: true
      t.string :text

      t.timestamps
    end
  end
end
