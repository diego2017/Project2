class ShoppingListsController < ApplicationController

  def index
    if current_user
      render json: ShoppingList.where(user_id: current_user.id).to_json(
        include: {
          list_items: {
            :include => :product
          }
        }
      )
    end
  end

end
