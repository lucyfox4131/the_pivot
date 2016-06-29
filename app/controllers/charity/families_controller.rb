class Charity::FamiliesController < ApplicationController
  def index
    @charity = Charity.find_by(slug: params[:charity_slug])
    @families = @charity.families
    @featured = Nationality.get_random
    @nationalities = Nationality.all
  end
end
