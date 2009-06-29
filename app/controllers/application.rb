# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include SimpleCaptcha::ControllerHelpers
  include AuthenticatedSystem
  filter_parameter_logging :password

  def send_welcome_email
    # triggered via:
    # http://localhost:3000/contacts/send_welcome_email

    # note the deliver_ prefix, this is IMPORTANT
    # gmail
    MyMailer.deliver_welcome("Dave", "")

    # optional, but I like to keep people informed
    flash[:notice] = "You've successfuly registered. Please check your email for a confirmation!"

    # render the default action
    render :action => 'index'  
  end
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '5ae18252fc09d13beb89bd0841fb5b43'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
