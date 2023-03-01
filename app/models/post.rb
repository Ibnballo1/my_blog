class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :author, presence: true
  validates :title, presence: true
  validates :text, presence: true
  validates :commentscounter, presence: true
  validates :likescounter, presence: true

  def update_post_counter(user)
    user.author.postscounter = user.author.posts.count
  end

  def five_most_recent_comment(post)
    post.comments.order(created_at: :desc).limit(5)
  end
end
