class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :author, :text, presence: true
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  attribute :comments_counter, :integer, default: 0

  after_save :update_post_counter

  def five_most_recent_comment
    comments.order('created_at desc').limit(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
