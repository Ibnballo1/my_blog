class AddForeignKeyAndIndexToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :post, null: false, foreign_key: true

    add_foreign_key :comments, :user, column: :author_id
    add_foreign_key :comments, :posts, column: :post_id
    add_index :comments, :post_id
  end
end
