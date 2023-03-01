class RenameAuthoridToAuthorIdInLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :authorid, :author_id
  end
end
