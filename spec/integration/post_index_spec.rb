require 'rails_helper'

RSpec.describe 'User Post Index', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
      @post = Post.create(author: @user, title: 'Salam', text: 'Assalam Alaekum brothers', comments_counter: 1, likes_counter: 0)
      @post_two = Post.create(author: @user, title: 'Greetings', text: 'How are you?', comments_counter: 0, likes_counter: 0)
    end

    it 'should show all posts for a user' do
      visit user_posts_path(@user)
      expect(page).to have_selector('img')
      expect(page).to have_content('Ibnballo')
      expect(page).to have_content('Number of posts: 2')
      expect(page).to have_text('Greetings')
      expect(page).to have_content('How are you?')
      expect(page).to have_content('There is no comment for this post')
      expect(page).to have_content('Comments: 0')
      expect(page).to have_content('Likes: 0')
      expect(page).to have_content('Pagination')
      click_on('Salam')
      expect(page).to have_content('by Ibnballo')
    end
  end
end
