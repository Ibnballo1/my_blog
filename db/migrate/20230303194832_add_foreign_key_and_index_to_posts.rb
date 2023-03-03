class AddForeignKeyAndIndexToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
    add_reference :posts, :comment, null: false, foreign_key: true
    add_reference :posts, :like, null: false, foreign_key: true
    add_column :posts, :author_id, :integer
    add_column :posts, :comments_counter, :integer
    add_column :posts, :likes_counter, :integer
  end
end
