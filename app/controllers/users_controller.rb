class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(clean_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  # Create new ShoppingList for current user
  def new_shopping_list



    new_shopping_list_name = params[:newShoppingListName]
    new_shopping_list = ShoppingList.create(name: new_shopping_list_name, user_id: current_user.id)
    render json: ShoppingList.where(user_id: current_user.id).to_json(
      include: {
        list_items: {
          include: {
            include: {
              product: {
                methods: [:full_img_path]
              }
            }
          }
        }
      }
    )
  end

  def checkout
    @current_user = current_user
    @products = []
    @basket_cost = 0
    current_user.products.uniq.each do |user_product|
      product = {}
      product[:product] = user_product

      product[:quantity] = 0
      # Get all list items with the same product and sum total quantity
      current_user.list_items.where(product_id: user_product.id).each do |list_item|
        product[:quantity] += list_item.quantity
      end

      product[:products_cost] = product[:product].price * product[:quantity]
      @basket_cost += product[:products_cost]
      @products.push(product)
    end
  end

  private

  def clean_params
    params.require(:user).permit(:name, :email, :password)
  end


end
