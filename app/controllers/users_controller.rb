class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.recent.order('created_at desc')
    @folders = Folder.where(user_id: current_user.id)
  end
end
