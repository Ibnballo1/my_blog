class UsersController < ApplicationController
  # to get all users
  def index
    @user = User.all
  end

  # To get a specific user and
  # to get a post from a particular user
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = @posts.id
  end
end
