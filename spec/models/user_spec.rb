require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name should be present' do
    user = User.new(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', postscounter: 0)
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'photo should be present' do
    user = User.new(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', postscounter: 0)
    user.photo = nil
    expect(user).to_not be_valid
  end

  it 'bio should be present' do
    user = User.new(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', postscounter: 0)
    user.bio = nil
    expect(user).to_not be_valid
  end

  it 'postscounter should be integer and greater than or equal to 0' do
    user = User.new(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', postscounter: 0)
    user.postscounter = 11
    expect(user).to be_valid
  end

  it 'should show the three most recent posts' do
    user = User.new(name: 'Ibnballo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', postscounter: 0)
    def three_most_recent_posts
      posts.order('created_at desc').limit(3)
    end
    expect(user.three_most_recent_posts).to eq([])
  end
end
