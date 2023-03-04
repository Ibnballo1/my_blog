require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Tom') }
  let(:post) { Post.new(author: user, text: 'This is my first post', likes_counter: 4) }
  let(:like) { Like.new(post:, author: user) }

  it 'increments the post comment counter' do
    post.increment!(:likes_counter)
    expect(post.likes_counter).to eq(5)
  end
end
