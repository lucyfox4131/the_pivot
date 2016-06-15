class CartController < ApplicationController

  def index
    if !session.exists? || !@cart.contents.empty?
      @cart_items = @cart.get_supply_items
    end
  end
end
