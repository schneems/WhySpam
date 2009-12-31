class AdminController < ApplicationController
  before_filter :require_user

  def index
        users = User.find(:all, :conditions => [ "created_at > ?",  (Time.now.beginning_of_day - 1.month) ],:order => 'created_at DESC')
    #    @users_month = User.find(:all, :conditions => [ "created_at < ?",  Time.now - 1.month ],:order => 'created_at DESC')


        @user_per_month = Array.new(30, 0)
        users.each do |user|
            0.upto(30) do |date|

              if user.created_at > (Time.now.beginning_of_day - (date+1).days) && user.created_at < (Time.now.beginning_of_day - date.days)
                @user_per_month[date] =+ 1 
              end
            end
        end
        @user_per_month.reverse!
        

        tickets = Ticket.find(:all, :conditions => [ "created_at > ?",  (Time.now.beginning_of_day - 1.month) ],:order => 'created_at DESC')
        
        @ticket_per_month = Array.new(30, 0)
        
        
        tickets.each do |ticket|
          
          
            0.upto(30) do |date|
            #  puts ticket.created_at.utc.to_s(:long)
            #  t = Time.now.beginning_of_day - (date+1).days
            #  puts t.utc.to_s(:long)
            #  t = Time.now.beginning_of_day - date.days
            #  puts t.utc.to_s(:long)
            #  puts "================================="
              
              
              if ticket.created_at.utc > (Time.now.beginning_of_day.utc - (date+1).days) && ticket.created_at.utc < (Time.now.beginning_of_day.utc - date.days)
                @ticket_per_month[date] =  @ticket_per_month[date]  + 1
                break
              end              
              
            end

        end
        @ticket_per_month.reverse!
        @ticket_count = @user_count = 0 
        @ticket_per_month.each{|ticket| @ticket_count += ticket.to_i }
        @user_per_month.each{|ticket| @user_count += ticket.to_i }
    
  end
  
  
  def show_users

  end

  protected
    def authorized?
      current_user.admin?
    end  
    
    
end
