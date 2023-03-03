class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :authorid
      t.integer :postid
      # add_foreign_key :likes, :users, column: :authorid
      # add_foreign_key :likes, :posts, column: :postid
      # add_index :likes, :authorid
      # add_index :likes, :postid

      t.timestamps
    end
  end
end
