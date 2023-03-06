class UsersController < ApplicationController
  # to get all users
  def index
    @user = User.all
  end

  # To Show a specific user
  def show
    @user = User.find(params[:id])
  end
end
