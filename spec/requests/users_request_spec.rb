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

  #   it 'shows correct body placeholder' do
  #     expect(response.body).to include('Here is a list of all posts of a certain user')
  #   end
  end
end
