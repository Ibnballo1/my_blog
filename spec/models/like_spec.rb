require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Tom') }
  let(:post) { Post.new(author: user, text: 'This is my first post', likescounter: 3) }
  let(:like) { Like.new(post:, author: user) }

  it 'increments the post comment counter' do
    post.increment!(:likescounter)
    expect(post.likescounter).to eq(4)
  end
end
