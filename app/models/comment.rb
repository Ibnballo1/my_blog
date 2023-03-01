class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true

  def self.update_comment_counter(id)
    post = Post.find_by(id:)
    post.commentscounter = post.comments.count
  end
end
