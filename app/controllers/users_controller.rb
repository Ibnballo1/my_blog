class UsersController < ApplicationController
  # to get all users
  def index
    @users = User.all
  end

  # To get a specific user and
  # to get a post from a particular user
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @posts = Post.all
  end

  def show_post
    @post = Post.find(params[:id])
  end
end
