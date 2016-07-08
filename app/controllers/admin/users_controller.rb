class Admin::UsersController < Admin::BaseController

  def new
    @user = User.new
    @charities = Charity.pluck(:name)
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      charity = find_charity(params)
      session[:user_id] = @user.id
      role = Role.find_by(name: "charity_admin")
      UserRole.create(user: @user, role: role, charity: charity)
      flash[:success] = "New admin '#{@user.username}' successfully created!"
      redirect_to admin_dashboard_path
    else
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attribute('email', user_params[:email]) && @user.update_attribute('cell', user_params[:cell])
      flash[:success] = "Your updates have been saved"
      if current_user.platform_admin?
        redirect_to admin_dashboard_path
      else
        redirect_to charity_dashboard_path(current_charity.slug, current_charity.id)
      end
    else
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.remove_admin_status
    flash[:success] = "Successfully removed admin status of #{@user.username}"
    redirect_to admin_dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :current_password, :email, :cell)
  end

end
