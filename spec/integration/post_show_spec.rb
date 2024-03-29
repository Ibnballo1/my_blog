require 'rails_helper'

RSpec.describe 'User Post Index', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
      @post = Post.create(author: @user, title: 'Salam', text: 'Assalam Alaekum brothers', comments_counter: 1, likes_counter: 0)
      @post_two = Post.create(author: @user, title: 'Greetings', text: 'How are you?', comments_counter: 0, likes_counter: 0)
      @comment = Comment.create(post: @post, author: @user, text: 'Walaekum Salam')
    end

    it 'should show all posts for a user' do
      visit user_post_path(@user, @post)
      expect(page).to have_text('Salam')
    end

    it 'should show post owner' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Ibnballo')
    end

    it 'show how many comment' do
      visit user_post_path(@user, @post)
      expect(page).to have_text('Comments: 2')
    end

    it 'show how many cats' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Likes: 0')
    end

    it 'should show post' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Assalam Alaekum brothers')
    end

    it 'should show user comment' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Ibnballo')
    end

    it 'should show the comment of a user' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Walaekum Salam')
    end
  end
end
