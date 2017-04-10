class ShoppingListsController < ApplicationController

  def index
    user_id = 2
    # user_id = session[user_id]

    render json: ShoppingList.where(user_id: user_id)
  end

end
