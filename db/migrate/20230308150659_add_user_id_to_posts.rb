class AddUserIdToPosts < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:posts, :user_id)
      add_column :posts, :user_id, :integer
      change_column_null :posts, :user_id, true
    end
  end
end
