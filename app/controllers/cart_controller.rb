class CartController < ApplicationController
  
  def index
    @cart_items = session[:cart]
  end
end
