class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart
  before_action :authorize!
  helper_method :current_user, :cart_item_count, :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def cart_item_count
    @cart_item_count ||= session[:cart].values.sum if session[:cart]
  end

  def current_admin?
    current_user && current_user.admin?
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
