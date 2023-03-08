require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'users#index' do
    before(:example) { get users_path }
    it 'is correct' do
      expect(response).to have_http_status(200)
    end

    it 'shows #index template' do
      expect(response).to render_template('index')
    end

    it 'shows correct body placeholder' do
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'users#show' do
    before :each do
      @user = User.create(
        name: 'Keenan',
        photo: 'photo',
        bio: 'Best golfer ever',
        posts_counter: 1
      )
      get "/users/#{@user.id}"
    end

    it 'is correct' do
      expect(response).to have_http_status(200)
    end

    it 'shows #show template' do
      expect(response).to render_template(:show)
    end

    it 'shows correct body placeholder' do
      expect(response.body).to include('Here is a user with this id')
    end
  end
end
