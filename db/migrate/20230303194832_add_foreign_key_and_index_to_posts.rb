class AddForeignKeyAndIndexToPosts < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :posts, :users, column: :author_id
    add_foreign_key :posts, :comments, column: :comments_counter
    add_foreign_key :posts, :likes, column: :likes_counter

    add_index :posts, :comments_counter
    add_index :posts, :likes_counter
  end
end
