class Admin::DashboardsController < Admin::BaseController

  def show
    @users = User.charity_admins(current_user.charities.first)
    @charity = current_user.charities.first

    if current_user.charity_admin?
      charity_id = current_user.user_roles.first.charity_id
      if !charity_id.nil?
        @charity = Charity.find(charity_id)
      end
    end

    if current_user.platform_admin?
      @users = User.all_admins
      @pending_charities = Charity.pending_charities
      @online_charities = Charity.online_charities
      @offline_charities = Charity.offline_charities
    end
  end
end
