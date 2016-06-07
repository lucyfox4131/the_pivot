class FamiliesController < ApplicationController

  def index
    @families = Family.all
  end
end
