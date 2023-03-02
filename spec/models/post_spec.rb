require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Tom', postscounter: 1) }
  let(:post) { Post.create(author: user, text: 'This is my first post', likescounter: 2, commentscounter: 1) }

  it 'increments the user posts counter' do
    user.increment!(:postscounter)
    expect(user.postscounter).to eq(2)
  end

  it 'title should be present' do
    post = Post.new(author_id: 2, title: 'Hello', text: 'I am from test', commentscounter: 0, likescounter: 0)
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'title should not be more than 250 character' do
    post = Post.new(author_id: 2, title: 'Hello', text: 'I am from test', commentscounter: 0, likescounter: 0)
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'commentscounter should be integer and greater than or equal to 0' do
    post = Post.new(author_id: 2, title: 'Hello', text: 'I am from test', commentscounter: 0, likescounter: 0)
    post.commentscounter = -1
    expect(post).to_not be_valid
  end

  it 'likescounter should be integer and greater than or equal to 0' do
    post = Post.new(author_id: 2, title: 'Hello', text: 'I am from test', commentscounter: 0, likescounter: 0)
    post.likescounter = -1
    expect(post).to_not be_valid
  end

  it 'should show the five or zero most recent comments' do
    post = Post.new(author_id: 2, title: 'Hello', text: 'I am from test', commentscounter: 0, likescounter: 0)
    def five_most_recent_comment
      comments.order('created_at desc').limit(5)
    end
    expect(post.five_most_recent_comment).to eq([])
  end
end
