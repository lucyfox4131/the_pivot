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
      url = "https://refugeerestart.herokuapp.com/families/#{@family.id}"
      TextSender.send_text_message(url)
      redirect_to admin_family_path(@family)
    else
      flash.now[:warning] = @family.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    family = Family.find(params[:id])
    if family.update(family_params)
     flash[:success] = "Your updates have been saved"
     redirect_to admin_dashboard_path
   else
     flash.now[:warning] = @family.errors.full_messages.join(", ")
     render :edit
   end
  end

  private

  def family_params
    params.require(:family).permit(
                                   :first_name,
                                   :last_name,
                                   :arrival_date,
                                   :num_married_adults,
                                   :num_unmarried_adults,
                                   :num_children_over_two,
                                   :num_children_under_two,
                                   :donation_deadline,
                                   :nationality_id,
                                   :description,
                                   :family_photo
                                   )
  end
end
