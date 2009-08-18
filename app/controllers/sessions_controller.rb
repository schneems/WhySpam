# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  layout "users"

  # render new.rhtml
  def new
  end

  def create
    
    logout_keeping_session!
    
    user = User.authenticate(params[:email], params[:password])

    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      redirect_to :action => "manage", :controller => "users"
      flash[:notice] = "- Logged in successfully"
      flash[:notice] += "<br /> - To help prevent unauthorized use please change your password by clicking 'Account Settings' below " if params[:email] == params[:password]
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      flash[:error] = "Login was Invalid please try again"
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
  
  def confirm_send_lost_pwd
    
  end
  
  
  def send_lost_password
    if simple_captcha_valid?
      flash[:notice] = "A confirmation email has been sent to the address you provided,"
      
      send_change_password_email
    else 
      flash[:error] = "Please copy the text from the image and try again"
    end
    redirect_to :back
  end



protected
def random_string(size = 16)
  s = ""
  size.times{s<< (i=Kernel.rand(62); i += ((i<10) ? 48 : ((i<36) ? 55 : 61 ))).chr }
  s
end  

  

  def send_change_password_email
      email = params[:email]
      puts "================================="
      puts email
      user = User.find_by_email(email).first
      if !user.nil? && user.valid?
        MyMailer.deliver_forgot_password(user)
      end
  end

  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
