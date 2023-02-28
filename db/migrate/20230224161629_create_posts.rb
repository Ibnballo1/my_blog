class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.text :text
      t.integer :commentscounter
      t.integer :likescounter
      add_foreign_key :posts, :users, column: :author_id
      add_foreign_key :posts, :comments, column: :commentscounter
      add_foreign_key :posts, :likes, column: :likescounter
      add_index :posts, :author_id
      add_index :posts, :commentscounter
      add_index :posts, :likescounter

      t.timestamps
    end
  end
end
