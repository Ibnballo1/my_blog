require 'rails_helper'

RSpec.describe User, type: :model do
  user {
    User.new(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', postscounter: 0)
  }

  before { user.save }

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end
end
