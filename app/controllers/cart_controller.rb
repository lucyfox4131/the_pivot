class CartController < ApplicationController

  def index
    if !session.exists? || !@cart.contents.empty?
      @supply_items = SupplyItem.get_supply_items_from_cart(session[:cart])
    end
  end
end
