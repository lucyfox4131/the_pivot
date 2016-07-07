class CategoriesController < ApplicationController
  def show
    if @category = Category.find_by(slug: params[:categories_slug])
      @families = @category.find_families
    else
      flash[:danger] =
      "Sorry, it seems that is not a category."
      redirect_to root_path and return
    end
  end
end
