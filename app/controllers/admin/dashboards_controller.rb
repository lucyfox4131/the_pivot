class Admin::DashboardsController < Admin::BaseController

  def show
    @charity = current_user.charities.first
    @users   = User.charity_admins(current_user.charities.first)

    if current_user.platform_admin?
      @users = User.all_admins
      @platform_admin    = current_user
      @pending_charities = Charity.pending_charities
      @online_charities  = Charity.online_charities
      @offline_charities = Charity.offline_charities
    end
  end

end
