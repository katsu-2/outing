class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: @category).includes(:user).includes(:category).page(params[:page]).per(10)
  end
end
