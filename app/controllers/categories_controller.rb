class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(slug: params[:id])
    if @category
      @families = @category.families.active
    else
      flash[:danger] =
      "Sorry, it seems that is not a category."
      redirect_to root_path and return
    end
  end
end
