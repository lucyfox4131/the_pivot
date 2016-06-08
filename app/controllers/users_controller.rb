class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to user_dashboard_path(@user)
    else
      flash.now[:notice] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
