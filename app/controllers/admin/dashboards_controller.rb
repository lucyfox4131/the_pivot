class Admin::DashboardsController < Admin::BaseController

  def show
    if current_user.charity_original_admin?
        @charity = current_user.charities.first
    end
  end
end
