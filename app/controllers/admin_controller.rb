class AdminController < ApplicationController
  before_filter :require_user

  def index
        time = Time.now - 7.days
        @user_total_count = User.count

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

        tickets = Ticket.find(:all, :conditions => [ "created_at > ?",  (Time.now.beginning_of_day - 1.month) ],:order => 'created_at DESC')

        @ticket_per_month = Array.new(30, 0)
        tickets.each do |ticket|
            0.upto(30) do |date|
              if ticket.created_at > (Time.now.beginning_of_day - (date+1).days) && ticket.created_at < (Time.now.beginning_of_day - date.days)
                @ticket_per_month[date] =+ 1 
              end
            end
        end

    
  end
  
  
  def show_users

  end

  protected
    def authorized?
      current_user.admin?
    end  
    
    
end
