class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user && user.active?
      cookies.permanent[:auth_token] = user.auth_token
      session[:user_id] = user.id
      redirect_to root_path(), :notice => "Logged in!"
    elsif user && !user.active?
      redirect_to root_path(), :notice => "Your account is currently inactive. If you believe this is an error, email ben@couponAdapter.com"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
