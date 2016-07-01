class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:categories_slug])
    if @category
      if @category == "Loan"
        @families = Loan.active.families
      else
        @families = @category.families.active
      end
    else
      flash[:danger] =
      "Sorry, it seems that is not a category."
      redirect_to root_path and return
    end
  end
end
