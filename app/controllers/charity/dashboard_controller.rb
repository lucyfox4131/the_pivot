class Charity::DashboardController < ApplicationController
  def show
    @admins = current_user.charity_admins(current_charity)
  end
end
