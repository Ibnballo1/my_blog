class PostsController < ApplicationController
  def index
    @user = User.all
    @users = User.find(params[:user_id])
    @posts = @users.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
