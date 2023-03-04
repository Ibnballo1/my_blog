class Like < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_save :update_like_counter

  private

  def update_like_counter
    post.increment!(:likes_counter)
  end
end
