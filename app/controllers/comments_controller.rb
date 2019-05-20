class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    redirect_to @post if @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
