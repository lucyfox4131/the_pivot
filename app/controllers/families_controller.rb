class FamiliesController < ApplicationController

  def index
    @families = Family.all
    @featured = Nationality.get_random


  end

  def show
    @family = Family.find(params[:id])
  end
end
