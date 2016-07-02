class Admin::DashboardsController < Admin::BaseController

  def show
    if current_user.roles.exists?(name: "charity_admin")
      id = current_user.user_roles.first.charity_id
        if !id.nil?
          @charity = Charity.find(id)
        end
    end
  end
end
