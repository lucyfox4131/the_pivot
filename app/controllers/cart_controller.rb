class CartController < ApplicationController

  def index
    # @cart_items = session[:cart]
    @supply_items = SupplyItem.get_supply_items_from_cart(session[:cart])
  end
end
