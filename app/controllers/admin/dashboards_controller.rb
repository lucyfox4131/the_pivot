class Admin::DashboardsController < Admin::BaseController

  def show
    #charity being passed in needs to be versatile
    @users = User.charity_admins(current_user.charities.first)
    @charity = current_user.charities.first
  end
end
