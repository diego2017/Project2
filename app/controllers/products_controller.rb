class ProductsController < ApplicationController
  def new
    @categories = Category.all
    @product = Product.new
  end

  def app
    @categories = Category.all
    @all_products_in_shop = []

    @allPerfumes = Category.find(1).products
    @allBooks = Category.find(2).products
    @allToys = Category.find(3).products
    @allTechnology = Category.find(4).products

    Category.all.each do |category|
      @all_products_in_shop.push(category.products)
    end
  end

  def create
    Product.find_or_create_by(clean_params)
    redirect_to root_path
  end

  private

  def clean_params
    params.require(:product).permit(:name, :price, :description, :img_src, :category_id)
  end

end
