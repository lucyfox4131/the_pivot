class HomesController < ApplicationController

  def show
    @categories = Category.all
  end
end
