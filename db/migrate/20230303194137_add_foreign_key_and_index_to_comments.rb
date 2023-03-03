class AddForeignKeyAndIndexToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :post, null: false, foreign_key: true
    add_column :comments, :author_id, :integer
    add_column :comments, :post_id, :integer
    add_index :comments, :post_id
  end
end
