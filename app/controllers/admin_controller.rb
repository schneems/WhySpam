class AdminController < ApplicationController
  before_filter :require_user
  include Graph

  def index
        
        @users =  format_highchart(:class => "User", :months => 1) #
        @tickets =  format_highchart(:class => "ticket", :months => 1)
        @whymails =  format_highchart(:class => "whymail", :months => 1)
        @websites =  format_highchart(:class => "Website", :months => 1)
        @surveys =  format_highchart(:class => "Survey", :months => 1)
             
         
  #    puts @websites[:data].to_json.gsub!(/\"/, '') 
  #     jsvars[:array] = ["hello"]
  #     jsvars[:arrayofArray] = [["hello"]]
  #     
  #    jsvars[:websites_array] = @websites[:data]
  #    jsvars[:surveys_array] = @surveys[:data]
       
  end
  
  
  def show_users

  end

  protected
    def authorized?
      current_user.admin?
    end  
    
    
end
