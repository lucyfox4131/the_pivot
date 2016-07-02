class Admin::BaseController < ApplicationController
  # before_action :require_admin
  before_action :authorize!

  # def require_admin
  #   render file: '/public/404' unless current_admin?
  # end

  private
    def authorize!
      render file: '/public/404' unless authorized?
      # redirect_to(root_url, warning: "You Do Not Have Access") unless authorized?
    end
end
