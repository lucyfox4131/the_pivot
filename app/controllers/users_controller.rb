class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.username}!"
      redirect_to dashboard_path
    else
      flash.now[:notice] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    redirect_to root_path if (!current_user || current_user.id != params[:id].to_i)
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Your updates have been saved"
      redirect_to dashboard_path
    else
      flash.now[:notice] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :current_password)
  end
end
