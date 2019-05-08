class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.recent.includes(:user)
  end

  def show
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
      flash[:notice] = "問題を作成しました"
    else
      render 'new'
      flash[:alert] = "問題作成に失敗しました"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:success] = "問題の編集が完了しました"
    else
      render 'edit'
      flash[:alert] = "問題の編集に失敗しました"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
    flash[:alert] = "問題を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :answer)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
