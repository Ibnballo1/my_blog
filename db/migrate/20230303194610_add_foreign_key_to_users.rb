class AddForeignKeyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :posts, column: :posts_counter
  end
end
