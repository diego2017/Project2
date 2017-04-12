class ShoppingListsController < ApplicationController

  def index
    user_id = session[:user_id]
    render json: ShoppingList.where(user_id: user_id).to_json(:include => :list_items)
  end

end
