class SessionsController < ApplicationController

  def new
    session[:return_to] ||= request.referer
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Hi, #{user.username}!"
      redirect_path(user)
    else
      flash.now[:danger] = "Invalid username or password. Try Again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end
  private

  def redirect_path(user)
    if user.charity_admin?
      session.delete(:return_to)
      redirect_to charity_dashboard_path(user.charity.slug, user.charity.id)
    elsif user.platform_admin?
      redirect_to admin_dashboard_path
    else
      if session[:return_to] && session[:return_to].include?("cart")
        redirect_to session.delete(:return_to)
      else
        session.delete(:return_to)
        redirect_to dashboard_path
      end
    end
  end
end
