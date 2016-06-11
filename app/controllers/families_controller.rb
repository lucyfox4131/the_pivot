class FamiliesController < ApplicationController

  def index
    @families = Family.active
  end

  def show
    @family = Family.find(params[:id])
  end
end
