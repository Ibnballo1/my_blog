require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
    end

    it 'should show I can see the username of all other users' do
      visit users_path
      expect(page).to have_content('List of all users')
      expect(page).to have_selector('img')
      expect(page).to have_content('Number of posts:')
      click_on('Ibnballo')
      expect(page).to have_content('Teacher')
    end
  end
end
