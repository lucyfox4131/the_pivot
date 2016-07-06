class Admin::DashboardsController < Admin::BaseController
  def show
    @admins = User.all_admins
    @charities = Charity.all
  end
end
