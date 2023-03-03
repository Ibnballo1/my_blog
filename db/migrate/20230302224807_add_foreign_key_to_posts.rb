class AddForeignKeyToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author, null: false, foreign_key: true
    add_reference :posts, :comments, null: false, foreign_key: true
    add_reference :posts, :likes, null: false, foreign_key: true
  end
end
