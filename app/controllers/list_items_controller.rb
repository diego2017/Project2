class ListItemsController < ApplicationController
  def show
    shopping_list_id = params[:id]
    render json: ShoppingList.find(shopping_list_id.to_i).list_items
  end
end
