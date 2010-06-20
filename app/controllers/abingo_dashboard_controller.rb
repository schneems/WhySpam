#Create a new controller.  The name is up to you -- this example
#uses abingo_dashboard_controller.rb
class AbingoDashboardController < ApplicationController
  #Declare any before_filters or similar which you need to use your authentication
  #for this controller.
  before_filter :authorized?


  include Abingo::Controller::Dashboard

  protected
    def authorized?
      authorized = current_user.try(:admin?) || false
      if authorized == false
        redirect_to '/'
        flash[:error] = "Sorry charlie, this area for admins only"
      end
    end

end


