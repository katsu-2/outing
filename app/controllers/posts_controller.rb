class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
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
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :answer)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
