class FamiliesController < ApplicationController

  def index
    @families = Family.all
    @featured = Nationality.get_random
    @nationalities = Nationality.all


  end

  def show
    @family = Family.find(params[:id])
  end
end
