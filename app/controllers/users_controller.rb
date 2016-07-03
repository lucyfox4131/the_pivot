class UsersController < ApplicationController
  before_action :check_for_correct_user, only: [:edit]

  def new
    @user = User.new
  end

  def index
    @current_user_charity = current_user.charities.first.name
    @users = User.all
  end

  def show
    if !current_user
      flash[:warning] = "Please login to see your dashboard"
      redirect_to login_path
    end
  end

  def create
    @user = User.new(user_params)
    if current_user.charity_original_admin?
      if @user.save
        session[:user_id] = @user.id
        @user.charities << current_user.charities.first
        @user.roles << Role.find_by(name: "charity_admin")
        flash[:success] = "Welcome, #{@user.username}!"
        redirect_to dashboard_path
      else
        flash.now[:warning] = @user.errors.full_messages.join(", ")
        render :new
      end
    else
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.username}!"
        redirect_to dashboard_path
      else
        flash.now[:warning] = @user.errors.full_messages.join(", ")
        render :new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
      @user.demote_user
      @user.charities.clear
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
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
    params.require(:user).permit(:username, :password, :current_password, :email, :cell, :charity)
  end

  def check_for_correct_user
    if (!current_user || current_user.id != params[:id].to_i)
      flash[:warning] = "Oops, you visited the wrong page."
      redirect_to root_path
    end
  end
end
