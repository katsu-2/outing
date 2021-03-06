class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.recent.page(params[:page]).per(6).order('created_at desc').includes(:category)
    @folders = Folder.where(user_id: @user.id).includes(:user)
    @likes = Like.where(user_id: current_user.id)
  end
end
