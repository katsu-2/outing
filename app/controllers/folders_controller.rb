class FoldersController < ApplicationController
  before_action :get_post, only: [:new, :create, :edit, :destroy]
  before_action :authenticate_user!, only: [:show, :new]

  def index
    @folders = Folder.all.includes(:user)
  end

  def show
    @folder = Folder.find(params[:id])
    @belongPosts = @folder.folder_posts
  end

  def new
    @folder = current_user.folders.new
    @posts = Post.all.includes(:user).includes(:category).page(params[:page]).per(10)
  end

  def create
    @folder = current_user.folders.new(folder_params)
    if @folder.save
      redirect_to root_path
      flash.now[:success] = "問題集を作成しました"
    else
      render 'new'
      flash.now[:alert] = "問題集の作成に失敗しました"
    end
  end

  def edit
    @folder = Folder.find(params[:id])
    @posts = Post.all.includes(:user).includes(:category).page(params[:page]).per(10)
  end

  def update
    @folder = Folder.find(params[:id])
    if @folder.update(folder_params)
      flash[:success] = "問題集の編集が完了しました"
      redirect_to folder_path(@folder)
    else
      flash[:alert] = "問題集の編集に失敗しました"
      render 'edit'
    end
  end

  private

  def folder_params
    params.require(:folder).permit(:name, {post_ids: []})
  end

  def get_post
    @posts = Post.all
  end
end
