class AdminController < ApplicationController
  before_filter :require_user
  include Graph

  def index

        user_hash = graphArray(:class => "User", :months => 1)
        ticket_hash = graphArray(:class => "ticket", :months => 1)     
        whymail_hash  = graphArray(:class => "whymail", :months => 1)
        
        @user_per_month = user_hash[:array]
        @user_count = user_hash[:count]
        
        @user_date_array = user_hash[:date_array]
        @ticket_per_month  = ticket_hash[:array]
        @ticket_count = ticket_hash[:count]
        @whymail_per_month = whymail_hash[:array]
        @whymail_count = whymail_hash[:count]
    
  end
  
  
  def show_users

  end

  protected
    def authorized?
      current_user.admin?
    end  
    
    
end
