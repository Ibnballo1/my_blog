require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
    end

    it 'should show the username of all users' do
      visit users_path
      expect(page).to have_content('List of all users')
    end

    it 'should show profile image' do
      visit users_path
      expect(page).to have_selector('img')
    end

    it 'should show number of posts' do
      visit users_path
      expect(page).to have_content('Number of posts:')
    end

    it 'should ridirect after clicking on a link' do
      visit users_path
      click_on('Ibnballo')
      expect(page).to have_content('Teacher')
    end
  end
end
