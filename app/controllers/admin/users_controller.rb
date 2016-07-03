class Admin::UsersController < Admin::BaseController

  def new
    @user = User.new
    @charity = current_user.charities.first.name
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.charities << current_user.charities.first
      @user.roles << Role.find_by(name: "charity_admin")
      flash[:success] = "Welcome, #{@user.username}!"
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
      if @user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    else
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
      @user.demote_user
      @user.charities.clear
      flash[:success] = "Successfully removed #{@user}"
    redirect_to admin_dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :current_password, :email, :cell)
  end

end
