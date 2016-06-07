class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @families = @category.families
  end
end
