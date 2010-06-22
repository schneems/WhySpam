# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "application-2", :except => [:test, :localtest, :foreign_show]  
  helper :all # include all helpers, all the time
 
  before_filter :set_abingo_identity
  
  
  
  include SimpleCaptcha::ControllerHelpers
  
 # include AuthenticatedSystem
 # include MailFixture
  
  include Cleanurl
  
 unless ActionController::Base.consider_all_requests_local
    rescue_from Exception,                            :with => :render_error
    rescue_from ActiveRecord::RecordNotFound,         :with => :render_not_found
    rescue_from ActionController::RoutingError,       :with => :render_not_found
    rescue_from ActionController::UnknownController,  :with => :render_not_found
    rescue_from ActionController::UnknownAction,      :with => :render_not_found
 end
   

  
  
#  filter_parameter_logging :password

  def send_welcome_email
    # triggered via:

    # note the deliver_ prefix, this is IMPORTANT
    # gmail
    MyMailer.deliver_welcome("Dave", "")

    # optional, but I like to keep people whymailrmed
    flash[:notice] = "You've successfuly registered. Please check your email for a confirmation!"

    # render the default action
    render :action => 'index'  
  end
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
#  protect_from_forgery  :secret => '5ae18252fc09d13beb89bd0842fb5b43'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
 #  filter_parameter_logging :password
 
 include AuthlogicSystem # see lib/authlogic_system
 #include ExceptionNotifiable
  
  helper :all
  helper_method :current_user_session, :current_user
  
  #filter_parameter_logging :password, :password_confirmation
  

  
  

  protected
   # def render_500
   #   respond_to do |type|
   #     type.html { render :template => "static/500", :status => "500 Error" }
   #     type.all  { render :nothing => true, :status => "500 Error" }
   #   end
   # end
   
   def render_error(exception)
     log_error(exception)
     notify_hoptoad(exception)
     activate_authlogic
     @error = 404
     render :template => "/static/notfound.html.erb", :status => @error
   end
   
   
   def render_not_found(exception)
         log_error(exception)
         notify_hoptoad(exception)
         activate_authlogic
         @error = 500
         render :template => "/static/notfound.html.erb", :status => @error     
   end
   
   

   def set_abingo_identity
     if (session[:abingo_identity])
       Abingo.identity = session[:abingo_identity]
     else
       session[:abingo_identity] = Abingo.identity = rand(10 ** 10).to_i
     end
   end
    
    
end
