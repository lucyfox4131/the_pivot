class Charity::FamiliesController < ApplicationController
  def index
    @featured = Nationality.get_random
    @nationalities = Nationality.all
  end
end
