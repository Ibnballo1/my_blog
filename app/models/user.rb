class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true
  validates :postscounter, presence: true

  def self.three_most_recent_posts(author)
    user = User.find_by(name: author)
    user.posts.order(created_at: :desc).limit(3)
  end
end
