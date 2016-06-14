class Admin::FamiliesController < Admin::BaseController

  def index
    @families = Family.all
    @nationalities = Nationality.all
  end

  def show
    @family = Family.find(params[:id])
  end

  def new
  end

  def create
  end
end
