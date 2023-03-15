require 'rails_helper'

RSpec.describe 'User Show', type: :system do
  describe 'show page' do
    before(:each) do
      @user = User.create(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
      @post = Post.create(author: @user, title: 'Salam', text: 'Assalam Alaekum brothers', comments_counter: 1, likes_counter: 0)
      @post_two = Post.create(author: @user, title: 'Greetings', text: 'How are you?', comments_counter: 0, likes_counter: 0)
    end

    it 'should show I can see the username of all other users' do
      visit user_path(@user)
      expect(page).to have_selector('img')
      expect(page).to have_content('Ibnballo')
      expect(page).to have_content('Number of posts:')
      expect(page).to have_text('Bio')
      expect(page).to have_content('Salam')
      expect(page).to have_content('Greetings')
      click_button('See all post')
      expect(page).to have_content('Teacher')
      expect(page).to have_content('Ibnballo')
    end
  end
end
