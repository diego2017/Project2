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

  def new_shopping_list
    user_id = session[:user_id]
    new_shopping_list_name = params[:newShoppingListName]
    new_shopping_list = ShoppingList.create(name: new_shopping_list_name, user_id: user_id)
    render json: ShoppingList.where(user_id: user_id).to_json(:include => :list_items)
  end
end
