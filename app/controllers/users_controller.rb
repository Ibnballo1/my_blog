class UsersController < ApplicationController
  # to get all users
  def index
    @users = User.all
  end

  # To get a specific user and
  # to get a post from a particular user
  def show
    @user = User.find(params[:id])
    @posts = Post.all
  end
end
