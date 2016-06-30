class CartController < ApplicationController

  def index
    if !session.exists? || !@cart.contents.empty?
      @cart_items = @cart.get_supply_items
      @cart_loan_items = @cart.get_loan_items
    end
  end
end
