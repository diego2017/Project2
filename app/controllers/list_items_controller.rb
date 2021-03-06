class ListItemsController < ApplicationController
  def index
    render json: User.find_by_id(current_user.id).list_items
  end

  def bulk_update

    new_quantities = params[:newQuantities]

    new_quantities.each do |list_item_id, quantity|
      list_item = ListItem.find(list_item_id.to_i)
      list_item.update_attributes(quantity: quantity.to_i)
    end

    render json: ShoppingList.where(user_id: current_user.id).to_json(
      include: {
        list_items: {
          include: {
            product: {
              methods: [:full_img_path]
            }
          }
        }
      }
    )

  end

  def create
    product_id = params[:product_id].to_i
    shopping_list_id = params[:shopping_list_id].to_i
    new_list_item = ListItem.create(shopping_list_id: shopping_list_id, product_id: product_id, quantity: 1)
    #
    # render json: { list_item: new_list_item }

  end
end
