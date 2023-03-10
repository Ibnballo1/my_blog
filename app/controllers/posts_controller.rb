class PostsController < ApplicationController
  def index
    @user = User.all
    @users = User.find(params[:user_id])
    @posts = @users.posts
  end

  def show
    @post = Post.find(params[:id])
    # @comments = @post.comments.includes(:user)
    # @users = @comments.map(&:user).uniq
  end
end
