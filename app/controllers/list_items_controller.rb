class ListItemsController < ApplicationController
  def show
    shopping_list_id = params[:id]
    render json: ShoppingList.find(shopping_list_id.to_i).list_items
  end

  def bulk_update
    new_quantities = params[:newQuantities]
    new_quantities.each do |list_item_id, quantity|
      list_item = ListItem.find(list_item_id.to_i)
      list_item.update_attributes(quantity: quantity.to_i)
    end

  end

  def update
    list_item_id = params[:id]
    binding.pry
  end
end
