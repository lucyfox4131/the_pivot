class PermissionsService

  def initialize(user, controller, action)
    @_controller = controller
    @_action     = action
    @_user       = user || User.new
  end

  def allow?
    if user.platform_admin?
      platform_admin_permissions
    elsif user.charity_admin?
      charity_admin_permissions
    elsif user.registered_user?
      registered_user_permissions
    else
      guest_user_permissions
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
      true
    end

    def charity_admin_permissions
      true
    end

    def registered_user_permissions
      if controller == "admin/dashboards"
        return false
      elsif controller == "admin/families"
        return false
      elsif controller == "admin/base"
        return false
      elsif controller == "loans" && action.in?(%w(new create edit update))
        return false
      else
        return true
      end
    end

    def guest_user_permissions
      if controller == "admin/dashboards"
        return false
      elsif controller == "admin/families"
        return false
      elsif controller == "admin/base"
        return false
      elsif controller == "loans" && action.in?(%w(new create edit update))
        return false
      else
        return true
      end
    end
end
