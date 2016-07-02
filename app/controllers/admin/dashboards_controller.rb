class Admin::DashboardsController < Admin::BaseController

  def show
    @charity = current_user.admin_charity
  end
end
