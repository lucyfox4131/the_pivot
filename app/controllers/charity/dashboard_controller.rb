class Charity::DashboardController < ApplicationController
  def show
    @users = User.charity_admins(current_user.charities.first)
    @charity = current_user.charities.first
    
  end
end
