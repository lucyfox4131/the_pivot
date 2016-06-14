class Admin::FamiliesController < Admin::BaseController

  def index
    @families = Family.all
    @nationalities = Nationality.all
  end

  def show
  end

  def new
  end

  def create
  end
end
