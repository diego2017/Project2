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
  end

  private

  def clean_params
    params.require(:user).permit(:name, :email, :password)
  end


end
