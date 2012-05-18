class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def routingError
    render :file => "#{Rails.root}/public/404.html", :status => 404
  end

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  def require_login
    unless current_user
      redirect_to root_path
    end
  end
  
  def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end

end
