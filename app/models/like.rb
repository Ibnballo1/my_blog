class Like < ActiveRecord::Base
  belongs_to :authored, class_name: 'User'
  belongs_to :post

  def self.update_like_counter(id)
    post = Post.find_by(id:)
    post.likescounter = post.likes.count
    post.save
  end
end
