require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Tom') }
  let(:post) { Post.new(author: user, text: 'This is my first post', comments_counter: 1) }
  let(:comment) { Comment.new(post:, author: user, text: 'Hi Tom!') }

  it 'increments the post comment counter' do
    post.increment!(:comments_counter)
    expect(post.comments_counter).to eq(2)
  end
end
