class ProductsController < ApplicationController
  def app

  end

  def load
    category = params[:category]
    render json: Category.find_by(name: category).products
  end

  def create

  end
end
