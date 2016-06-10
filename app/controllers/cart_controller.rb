class CartController < ApplicationController
  has_many :cart_items
  
  def index
    @cart_items = session[:cart]
  end
end
