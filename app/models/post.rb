class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :author, presence: true
  validates :title, presence: true
  validates :text, presence: true
  validates :commentscounter, presence: true
  validates :likescounter, presence: true

  def self.update_post_counter(author)
    user = User.find_by(name: author)
    user.postscounter = user.posts.count
    user.save
  end

  def self.five_most_recent_comment(title)
    post = Post.find_by(title:)
    post.comments.order(created_at: :desc).limit(5)
  end
end
