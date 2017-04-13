class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    Category.find_or_create_by(clean_params)
    redirect_to root_path
  end

  private

  def clean_params
    params.require(:category).permit(:name)
  end
end
