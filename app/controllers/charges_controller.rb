class ChargesController < ApplicationController
  def new
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

  def create
    # Amount in cents
    @basket_cost = params[:basket_cost]
    @amount = (params[:basket_cost]*100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
