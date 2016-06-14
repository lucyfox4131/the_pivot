class Admin::FamiliesController < Admin::BaseController

  def index
    @families = Family.all
    @nationalities = Nationality.all
  end

  def show
    @family = Family.find(params[:id])
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      @family.create_supply_items
      flash[:success] = "Family with last name, #{@family.last_name}, created!"
      redirect_to admin_family_path(@family)
    else
      flash.now[:warning] = @family.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def family_params
    params.require(:family).permit(:first_name,
                                   :last_name,
                                   :arrival_date,
                                   :num_married_adults,
                                   :num_unmarried_adults,
                                   :num_children_over_two,
                                   :num_children_under_two,
                                   :donation_deadline,
                                   :nationality_id,
                                   :description,
                                   :family_photo)
  end
end
