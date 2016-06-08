class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Hi, #{user.username}!"
      redirect_to dashboard_path
    else
      flash.now[:notice] = "Invalid username or password. Try Again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye!"
    redirect_to root_path
  end
end
