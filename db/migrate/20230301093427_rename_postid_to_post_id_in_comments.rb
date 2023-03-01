class RenamePostidToPostIdInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :postid, :post_id
  end
end
