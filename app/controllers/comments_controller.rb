class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end

  def create
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.new(strong_params)
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      redirect_to user_posts_path(current_user, @post)
    else
      render :new
    end
  end

  def strong_params
    params.require(:comment).permit(:text)
  end
end
