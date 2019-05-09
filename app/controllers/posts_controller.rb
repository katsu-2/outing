class PostsController < ApplicationController
  before_action :set_category, only: [:new, :create, :edit, :update]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.recent.page(params[:page]).per(10).search(params[:search]).includes(:user).includes(:category)

  end

  def show
    @user = User.find_by(id: @post.user_id)
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "問題を作成しました"
      redirect_to root_path
    else
      flash[:alert] = "問題作成に失敗しました"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "問題の編集が完了しました"
      redirect_to post_path(@post)
    else
      flash[:alert] = "問題の編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
    flash[:alert] = "問題を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :answer, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_category
    @category = Category.all
  end
end
