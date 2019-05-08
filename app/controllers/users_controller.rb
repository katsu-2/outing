class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.order('created_at desc')
  end
end
