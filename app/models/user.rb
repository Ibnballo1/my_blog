class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true
  validates :postscounter, presence: true
end
