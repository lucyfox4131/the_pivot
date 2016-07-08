class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart
  before_action :authorize!
  helper_method :current_user, :cart_item_count, :current_admin?, :current_charity
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_charity
    current_user.charity
  end

  def dashboard_redirect(current_user)
    if current_user.platform_admin?
      admin_dashboard_path
    elsif current_user.charity_admin?
      charity_dashboard_path(current_user.charity.slug, current_user.charity.id)
    else
      dashboard_path
    end
  end

  def find_charity(params)
    if params[:user][:charity]
      charity = Charity.find_by(name: params[:user][:charity])
    else
      current_user.charity
    end
  end

  private
    def authorize!
      redirect_to(root_url, warning: "You Do Not Have Access") unless authorized?
    end

    def authorized?
      current_permission.allow?
    end

    def current_permission
      @current_permission ||= PermissionsService.new(current_user, params[:controller], params[:action])
    end
end
