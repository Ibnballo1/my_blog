require 'rails_helper'

RSpec.describe 'User Post Index', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
      @post = Post.create(author: @user, title: 'Salam', text: 'Assalam Alaekum brothers', comments_counter: 1, likes_counter: 0)
      @post_two = Post.create(author: @user, title: 'Greetings', text: 'How are you?', comments_counter: 0, likes_counter: 0)
      @comment = Comment.create(post: @post_two, author: @user, text: 'This is a test comment')
    end

    it 'should show all posts for a user' do
      visit user_posts_path(@user)
      expect(page).to have_selector('img')
    end

    it 'should show username' do
      visit user_posts_path(@user)
      expect(page).to have_content('Ibnballo')
    end

    it 'should show number of posts' do
      visit user_posts_path(@user)
      expect(page).to have_content('Number of posts: 2')
    end

    it 'should show post title' do
      visit user_posts_path(@user)
      expect(page).to have_text('Greetings')
    end

    it 'should show post content' do
      visit user_posts_path(@user)
      expect(page).to have_content('How are you?')
    end

    it 'should show comment' do
      visit user_posts_path(@user)
      expect(page).to have_content('This is a test comment')
    end

    it 'should show comment count' do
      visit user_posts_path(@user)
      expect(page).to have_content('Comments: 1')
    end

    it 'should show how many likes' do
      visit user_posts_path(@user)
      expect(page).to have_content('Likes: 0')
    end

    it 'should show pagination' do
      visit user_posts_path(@user)
      expect(page).to have_content('Pagination')
    end

    it 'should show post when clicked' do
      visit user_posts_path(@user)
      click_on('Salam')
      expect(page).to have_content('by Ibnballo')
    end
  end
end
