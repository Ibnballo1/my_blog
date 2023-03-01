class RenameAuthoridToAuthorIdInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :authorid, :author_id
  end
end
