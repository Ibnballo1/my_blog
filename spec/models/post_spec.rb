require 'rails_helper'

RSpec.describe Post, type: :model do
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

  it 'should update post counter' do
    user = User.new(id: 16, name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', postscounter: 0)
    # expect(user.postscounter).to eq(0)
    post = Post.new(author_id: user, title: 'Hello', text: 'I am from test', commentscounter: 0, likescounter: 0)
    # def update_post_counter
    #   author.increment!(:postscounter)
    # #   user.postscounter += 1
    # end

    # result = post.send(:update_post_counter)
    expect { post.send(:update_post_counter) }.to change { user.reload.postscounter }.by(1)
  end
end
