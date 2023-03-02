require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Tom') }
  let(:post) { Post.new(author: user, text: 'This is my first post', commentscounter: 1) }
  let(:comment) { Comment.new(post:, author: user, text: 'Hi Tom!') }

  it 'increments the post comment counter' do
    post.increment!(:commentscounter)
    expect(post.commentscounter).to eq(2)
  end
end
