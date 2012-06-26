class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def routingError
    render :file => "#{Rails.root}/public/404.html", :status => 404
  end

  private

  def find_section_page(page_type)
    puts ''
    puts 'find section page'
    @section = Section.find(:first, :conditions => ['page_type = ?', page_type], :order => 'created_at desc')
  end

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  def require_login
    unless current_user
      redirect_to root_path, :notice => 'You must be logged in to view that page.'
    end
  end
  
  def admin?
    if current_user && current_user.admin?
      return true
    else
      return false
    end
  end

  def require_admin
    unless admin?
      redirect_to root_path, :notice => 'You must be an admin to view that page.'
    end
  end

  def require_admin_or_contributor
    unless admin? || current_user.user_type == 'Contributor'
      redirect_to root_path, :notice => 'You are not authorized to view that page.'
    end
  end

  def transaction_amount(transaction_type, startup_id)
    Transaction.sum(:amount, :conditions => ['transaction_type = ? AND startup_id = ?', transaction_type, startup_id]).to_f
  end

end
