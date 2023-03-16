require 'rails_helper'

RSpec.describe 'User Show', type: :system do
  describe 'show page' do
    before(:each) do
      @user = User.create(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
      @post = Post.create(author: @user, title: 'Salam', text: 'Assalam Alaekum brothers', comments_counter: 1, likes_counter: 0)
      @post_two = Post.create(author: @user, title: 'Greetings', text: 'How are you?', comments_counter: 0, likes_counter: 0)
    end

    it 'should show profile image' do
      visit user_path(@user)
      expect(page).to have_selector('img')
    end

    it 'should show username of users' do
      visit user_path(@user)
      expect(page).to have_content('Ibnballo')
    end

    it 'should show number of posts' do
      visit user_path(@user)
      expect(page).to have_content('Number of posts:')
    end

    it 'should show user\'s Bio' do
      visit user_path(@user)
      expect(page).to have_text('Bio')
    end

    it 'should show users post' do
      visit user_path(@user)
      expect(page).to have_content('Salam')
    end

    it 'should show user post' do
      visit user_path(@user)
      expect(page).to have_content('Greetings')
    end

    it 'should show all posts after clicking a button' do
      visit user_path(@user)
      click_button('See all post')
      expect(page).to have_content('Ibnballo')
    end
  end
end
