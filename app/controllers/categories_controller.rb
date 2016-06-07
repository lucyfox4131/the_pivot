class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(slug: params[:id])
    @families = @category.families
  end
end
