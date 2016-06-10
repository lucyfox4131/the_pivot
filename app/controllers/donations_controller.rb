class DonationsController<ApplicationController

  def index
    if !current_user
      flash[:notice] = "Please login to see your donation history."
      redirect_to login_path
    else
      @donations = current_user.donations
    end
  end

  def show
    @donation = Donation.find(params[:id])
    if @donation.user != current_user
      flash[:notice] = "No donation found."
      redirect_to root_path
    end
  end

end
