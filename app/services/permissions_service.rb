class PermissionsService

  def initialize(user, controller, action)
    @_controller = controller
    @_action     = action
    @_user       = user || User.new
  end

  def allow?
    if user.platform_admin?
      platform_admin_permissions
    elsif user.charity_admin? || user.primary_charity_admin?
      charity_admin_permissions
    else user.other_user?
      other_user_permissions
    end
  end

  private
    def controller
      @_controller
    end

    def action
      @_action
    end

    def user
      @_user
    end

    def platform_admin_permissions
      return true if controller == 'admin/dashboards' && action.in?(%w(show))
      return true if controller == 'admin/users' && action.in?(%w(update destroy create new edit))
      return true if controller == 'admin/families' && action.in?(%w(show new create index edit update))

      return true if controller == 'sessions' && action.in?(%w(new create destroy))
      return true if controller == 'families' && action.in?(%w(index show))
      return true if controller == 'users' && action.in?(%w(index new create edit update))
      return true if controller == 'cart' && action.in?(%w(index))
      return true if controller == 'cart_items' && action.in?(%w(create update destroy))
      return true if controller == 'donations' && action.in?(%w(index show new create))
      return true if controller == 'loans' && action.in?(%w(show new create edit update))
      return true if controller == 'homes' && action.in?(%w(show))
      return true if controller == 'charities' && action.in?(%w(index new create edit update show))
      return true if controller == 'charity/families' && action.in?(%w(index))
      return true if controller == 'categories' && action.in?(%w(show))
    end

    def charity_admin_permissions
      return true if controller == 'admin/users' && action.in?(%w(update destroy create new edit))
      return true if controller == 'admin/families' && action.in?(%w(show new create index edit update))
      return true if controller == 'charity/dashboard' && action.in?(%w(show))

      return true if controller == 'sessions' && action.in?(%w(new create destroy))
      return true if controller == 'families' && action.in?(%w(index show))
      return true if controller == 'users' && action.in?(%w(index new create edit update))
      return true if controller == 'cart' && action.in?(%w(index))
      return true if controller == 'cart_items' && action.in?(%w(create update destroy))
      return true if controller == 'donations' && action.in?(%w(index show new create))
      return true if controller == 'loans' && action.in?(%w(show new create edit update))
      return true if controller == 'homes' && action.in?(%w(show))
      return true if controller == 'charities' && action.in?(%w(index new create edit update show))
      return true if controller == 'charity/families' && action.in?(%w(index))
      return true if controller == 'categories' && action.in?(%w(show))
    end

    def other_user_permissions
      return true if controller == 'sessions' && action.in?(%w(new create destroy))
      return true if controller == 'families' && action.in?(%w(index show))
      return true if controller == 'users' && action.in?(%w(show new create edit update))
      return true if controller == 'cart' && action.in?(%w(index))
      return true if controller == 'cart_items' && action.in?(%w(create update destroy))
      return true if controller == 'donations' && action.in?(%w(index show new create))
      return true if controller == 'loans' && action.in?(%w(show edit update))
      return true if controller == 'homes' && action.in?(%w(show))
      return true if controller == 'charities' && action.in?(%w(index new create show))
      return true if controller == 'charity/families' && action.in?(%w(index))
      return true if controller == 'categories' && action.in?(%w(show))
    end
end
