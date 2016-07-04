class CharitiesController < ApplicationController

  def index
    @charities = Charity.online_charities
  end

  def show
    @charity = Charity.find_by(params[:id])
    @families = @charity.families
    @donation_stats = Donation.stats
  end

  def edit
    @charity = Charity.find(params[:id])
  end

  def update
    charity = Charity.find(params[:id])
    if charity.update(charity_params)
      flash[:success] = "Your updates have been saved"
      redirect_to admin_dashboard_path
    else
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def new
    if current_user
      @charity = Charity.new
    else
      flash[:error] = "You must be logged in to create a new charity"
      redirect_to charities_path
    end
  end

  def create
    @charity = Charity.new(name: params[:charity][:name],
                          description: params[:charity][:description],
                          status: 0)
    if @charity.save
      flash[:success] = "Your charity request has been recieved.
        Once it has been approved it will be visible on our site."
      redirect_to charities_path
    else
      flash[:error] = "Make sure you have filled in both name and description."
      redirect_to new_charity_path
    end
  end

  private
    def charity_params
      params.require(:charity).permit(:name,
                                      :description,
                                      :status)
  end
end
