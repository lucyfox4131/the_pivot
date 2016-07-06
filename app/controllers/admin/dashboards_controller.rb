class Admin::DashboardsController < Admin::BaseController
  def show
    @users = User.all_admins
    @charities = Charity.all
  end
end
