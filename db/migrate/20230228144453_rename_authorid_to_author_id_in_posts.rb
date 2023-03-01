class RenameAuthoridToAuthorIdInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :authorid, :author_id
  end
end
