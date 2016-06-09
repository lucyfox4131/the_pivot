class DonationsController<ApplicationController

  def index
    @donations = current_user.donations
  end

end
