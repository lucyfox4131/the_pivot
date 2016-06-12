class FamiliesController < ApplicationController

  def index
    @families = Family.all
  end

  def show
    @family = Family.find(params[:id])
    if @family.total_value_of_supplies_purchased > 0
      @supplies_needed_value = @family.total_value_of_supplies_needed
      @supplies_purchased_value = @family.total_value_of_supplies_purchased
      @percentage_purchased = @family.percentage_donated
    else
      @supplies_needed_value = @family.total_value_of_supplies_needed
      @supplies_purchased_value = 0
      @percentage_purchased = 0
    end
  end
end
