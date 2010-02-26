class AdminController < ApplicationController
  before_filter :require_user
  layout "admin"
  
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
  
  
  def websites
    @websites = Website.find(:all, :conditions => [ "created_at > ?",  (Time.now.end_of_day - 1.month) ],:order => 'created_at DESC')
  #  @users = User.find(:all, :conditions => [ "created_at > ?",  (Time.now.end_of_day - 1.month) ],:order => 'created_at DESC')
  end
  
  
  
  
  def show_users

  end

  protected
    def authorized?
      current_user.admin?
    end  
    
    
end
