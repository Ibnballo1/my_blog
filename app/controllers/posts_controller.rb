class PostsController < ApplicationController
  def index
    # @user = User.all
    # @users = User.find(params[:user_id])
    # @posts = @users.posts
    @users = User.find(params[:user_id])
    @posts = @users.posts.includes(:comments)
    # @users = User.includes(:posts, :comments, :likes).find_by_id(params[:user_id])
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.five_most_recent_comment
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
