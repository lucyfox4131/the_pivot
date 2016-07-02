class CharitiesController < ApplicationController

  def index
    @charities = Charity.all
  end

  def show
    @charity = Charity.find(params[:id])
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

  private
    def charity_params
      params.require(:charity).permit(:name,
                                      :description,
                                      :status)
  end
end
