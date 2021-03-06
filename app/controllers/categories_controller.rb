class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
  end


  def show
    @category = Category.find(params[:id])
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end
end
