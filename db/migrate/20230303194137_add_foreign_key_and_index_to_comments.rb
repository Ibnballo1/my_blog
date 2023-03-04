class AddForeignKeyAndIndexToComments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts, column: :post_id
    add_index :comments, :authorid
    add_index :comments, :postid
  end
end
