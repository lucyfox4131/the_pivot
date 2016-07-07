class CartItemsController < ApplicationController

  def create
    cart_item = @cart.create_new_cart_item(params)
    flash[:success] = "Successfully added to your cart!"
    session[:cart] = @cart.contents
    redirect_to family_path(cart_item.family)
  end

  def update
    @cart.update_cart_item(params)
    session[:cart] = @cart.contents
    redirect_to cart_index_path
  end

  def destroy
    cart_item = @cart.find_item_to_destroy(params)
    session[:cart] = @cart.contents
    flash[:success] = "Successfully deleted #{view_context.link_to(cart_item[:name], family_path(cart_item[:family]))} from your cart."
    redirect_to cart_index_path
  end
end
