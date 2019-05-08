class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.recent.page(params[:page]).per(6).order('created_at desc').includes(:category)
    @folders = Folder.where(user_id: current_user.id)
    @likes = Like.where(user_id: current_user.id)
  end
end
