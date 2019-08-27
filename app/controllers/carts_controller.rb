class CartsController < ApplicationController

  def show
  end

  def add_item
    @product = Product.find params[:product_id]
    if @product && @product.quantity > 0
      product_id = params[:product_id].to_s
      modify_cart_delta(product_id, +1)
    end
    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
