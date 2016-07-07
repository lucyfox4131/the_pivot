class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if !current_user
      flash[:warning] = "Please login to see your dashboard"
      redirect_to login_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username}!"
      redirect_to dashboard_path
    else
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Your updates have been saved"
      redirect_to dashboard_path
    else
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

   private

   def user_params
     params.require(:user).permit(:username, :password, :current_password, :email, :cell)
   end
end
