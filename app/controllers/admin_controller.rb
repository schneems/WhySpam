class AdminController < ApplicationController
  before_filter :require_user

  def index
    
  end
  
  
  def show_users
    time = Time.now - 7.days
    @user_total_count = User.count
    
    users = User.find(:all, :conditions => [ "created_at > ?",  (Time.now.beginning_of_day - 1.month) ],:order => 'created_at DESC')
#    @users_month = User.find(:all, :conditions => [ "created_at < ?",  Time.now - 1.month ],:order => 'created_at DESC')
    
    
    @month = Array.new(45, 0)
    users.each do |user|
        0.upto(45) do |date|
          
          if user.created_at > (Time.now.beginning_of_day - (date+1).days) && user.created_at < (Time.now.beginning_of_day - date.days)
            @month[date] =+ 1 
          end
        end
    end

    
  end

  protected
    def authorized?
      current_user.admin?
    end  
    
    
end
