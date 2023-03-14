require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  describe 'index page' do
    before :each do
      @user = User.new(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 0)
    end
    it 'Should show I can see the username of all other users' do
      visit root_path
      expect(page).to have_content('This page list all users')
    end
  end
end
