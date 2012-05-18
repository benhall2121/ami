class AmiMailer < ActionMailer::Base
  include ApplicationHelper
  
  def password_reset(user)
    @user = user
    @full_url_path = full_path
    mail(:to => user.email, :from => 'Website@benerino.com', :subject => "AMI Password Reset")
  end
  
  def new_signup_email(user)
    @user = user
    @full_url_path = full_path
    mail(:to => user.email, :from => 'Website@benerino.com', :subject => "Welcome to AMI")
  end
end
