class AddForeignKeyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :post, null: false, foreign_key: true
    add_column :users, :posts_counter, :integer
  end
end
