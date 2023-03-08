require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'posts#index' do
    before :each do
      @user = User.create(
        name: 'Keenan',
        photo: 'photo',
        bio: 'Best golfer ever',
        posts_counter: 1
      )
      get "/users/#{@user.id}/posts"
    end
    it 'is correct' do
      expect(response).to have_http_status(200)
    end

    it 'shows #index template' do
      expect(response).to render_template('index')
    end

    it 'shows correct body placeholder' do
      expect(response.body).to include('Here is a list of all posts of a certain user')
    end
  end

  describe 'posts#show' do
    before :each do
      @user = User.create(
        name: 'Keenan',
        photo: 'photo',
        bio: 'Best golfer ever',
        posts_counter: 1
      )
      @post = Post.create(
        author: @user,
        author_id: @user.id,
        title: 'Hello',
        text: 'This is my first post',
        comments_counter: 0,
        likes_counter: 0,
        user_id: 0
      )
      get "/users/author_id/posts/#{@post.id}"
    end

    it 'is correct' do
      expect(response).to have_http_status(200)
    end

    it 'shows #index template' do
      expect(response).to render_template(:show)
    end

    it 'shows correct body placeholder' do
      expect(response.body).to include("<p>Here is a user's post with this id</p>")
    end
  end
end
