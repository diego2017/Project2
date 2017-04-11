class ProductsController < ApplicationController

  def index
    render json: Product.all
  end

  def app
    @categories = Category.all
    @allPerfumes = Category.find_by(name: "Perfumes").products
    @allBooks = Category.find_by(name: "Books").products
    @allToys = Category.find_by(name: "Toys").products
    @allTechnology = Category.find_by(name: "Technology").products
  end

  # def load
  #   category = params[:category]
  #   render json: Category.find_by(name: category).products
  # end

  def create

  end
end
