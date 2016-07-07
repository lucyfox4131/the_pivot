class SessionsController < ApplicationController

  def new
    session[:return_to] ||= request.referer
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Hi, #{user.username}!"
      if @cart.contents.count > 0
        redirect_to cart_index_path
      else
        redirect_to dashboard_redirect(current_user)
      end
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
end
