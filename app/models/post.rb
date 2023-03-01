class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :author, presence: true
  validates :title, presence: true
  validates :text, presence: true
  validates :commentscounter, presence: true
  validates :likescounter, presence: true

  after_save :update_post_counter

  def self.five_most_recent_comment(title)
    post = Post.find_by(title:)
    post.comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
