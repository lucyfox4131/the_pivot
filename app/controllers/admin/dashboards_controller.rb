class Admin::DashboardsController < Admin::BaseController

  def show
    @users = User.all_admins
    @charity = current_user.charities.first

    @users = User.all_admins
    @pending_charities = Charity.pending_charities
    @online_charities = Charity.online_charities
    @offline_charities = Charity.offline_charities

  end
end
