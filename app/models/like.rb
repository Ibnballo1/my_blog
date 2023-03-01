class Like < ActiveRecord::Base
  belongs_to :authored, class_name: 'User'
  belongs_to :post

  def update_like_counter(post)
    post.likescounter.count
  end
end
