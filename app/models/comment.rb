class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true

  def update_comments_counter
    post.increment!(:commentscounter)
  end
end
