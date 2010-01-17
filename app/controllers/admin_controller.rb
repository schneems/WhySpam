class AdminController < ApplicationController
  before_filter :require_user
  include Graph

  def index
        @users =  format_highchart(:class => "User", :months => 1) #
        @tickets =  format_highchart(:class => "ticket", :months => 1)
        @whymails =  format_highchart(:class => "whymail", :months => 1)
  end
  
  
  def show_users

  end

  protected
    def authorized?
      current_user.admin?
    end  
    
    
end
