class Post < ApplicationRecord
  belongs_to :author, :class_name => 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true
  validates :text, presence: true
  validates :commentscounter, presence: true
  validates :likescounter, presence: true
end
