class RenamePostidToPostIdInLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :postid, :post_id
  end
end
