class TicketsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  
  ## sudo god -c ./config/fetcher-daemon.god -D
  ## check for logged in and user before viewing mail and deleting !!
  
  ## ummm, you can manually go go http://localhost:3000/tickets/index/133 when you're not logged in...fix that
  
  ## command t finds file name in project...totally aweso
  layout "users", :except => [:spam_survey, :report_spam, :test, :ie, :ie2, :test2, :HEY, :optional]
  

  def index
    ## this is gross, relies on chance, what if user has an info and a form with the same ID? 
    

     id = params[:id]
     @info = Info.find(:first, :include => [:tickets, :user], :conditions => ["id = ?", id], :order => "created_at DESC")
     if @info.nil?
       @info = Forms.find(:first, :include => [:tickets, :user], :conditions => ["id = ?", id], :order => "created_at DESC")       
       @tickets = @info.tickets
     else  
       @tickets = @info.tickets
     end     
     
    if @info.user.nil? || @info.user != current_user
      @tickets = nil
      @info = nil
      redirect_to :back
      flash[:error] = "something went wrong, it looks like you're not logged in, or you don't have proper permission"
    end
  #  @ticket = Ticket.new
  end
  
  def show_slop
    # will only be used for slop box
    
        flash[:error] = ""
       #  @ticket = Ticket.first
       @to_email = to_email = params[:ticket][:to_email]  
       @ticket = Ticket.new(:to_email => to_email)       
         if simple_captcha_valid?
           email_length = to_email.scan(/[\w.]+@/)[0].to_s.size           
           @tickets = Ticket.find(:all, :conditions => ["to_email = ?", to_email])
           info = Info.find(:first, :conditions => ["cryptmail = ?", to_email])
             if !@tickets[0].nil? and email_length != 21 and info == nil
               @tickets = @tickets
               flash[:notice] = "You've got mail"
               
               render :action => "index"
               
             else 
               flash[:error]  += "- We haven't received any email at this email address, please try again later. <br />" if @tickets[0].nil?
               redirect_to :back
             end
           else
             flash[:error]  += "- The Text from the Image did not Match the text, please try again <br />"
             redirect_to :back
         end
        flash[:error]  += "- This email is being used by a WhySpam Secure Email.<br />" if info != nil
        flash[:error]  += "- This is an address that may be used by a WhySpam Secure Email in the future, <br /> to ensure that you never pick a WhySpam Secure email by accident, always pick a url that does not equal 20 characters such as:  1#{to_email}<br />" if email_length == 21 
        flash[:error] = nil if flash[:error] == ""
  end


  
  
  
  def show_all_tickets
    info_id = params[:info]
    @info = Info.find(:first, :include => :tickets, :conditions => ["id = ?", info_id], :order => "created_at DESC")
    @tickets = @info.tickets
  end

#  def show
#    # if User.current_user.logged_in?
#      if logged_in?
#        info_id = params[:id]
#        @info = Info.find(:first, :include => :user, :conditions => ["id = ?", info_id])
#        puts @info.id
#        puts @info.user
#      
#        redirect_to view_all_spam_url(:info => @info.id) if @info.user == current_user
#      end #  if logged_in?s
#  end
  
  def show
    ticket_id = params[:id].to_i
    @ticket = Ticket.find(:first, :include => [:info => :user], :conditions => ["id = ?", ticket_id])
    if @ticket.info == nil && @ticket.forms == nil
      render :partial => "show"
      @user = nil
      
    else
      @user = @ticket.info.user  if @ticket.info != nil
      @user = @ticket.forms.user if @ticket.forms != nil
      if current_user == @user
        render :partial => "show"
      else
        redirect_to :back
      end
    end

    
  #  info_id = params[:info]
  #  @info = Info.find(:first, :include => :tickets, :conditions => ["id = ?", info_id], :order => "created_at DESC")
  #  @tickets = @info.tickets
  end
  
  
  def delete

    ticket_id = params[:id]
    ticket = Ticket.find(:first, :include => [:info => :user], :conditions => ["id = ?", ticket_id])||Ticket.find(:first, :include => [:forms => :user], :conditions => ["id = ?", ticket_id])
    info = ticket.info if ticket.info.nil?
    
    if ticket.info.nil?
      form = ticket.forms
      user = form.user
      flash[:notice] = "Form to " + forms_url + '/'+ form.crypt_form + " has been deleted"
      
      redirect_to :action => 'index', :id => form.id
    else
      info = ticket.info
      user = info.user
      flash[:notice] =  info.cryptmail + " has been deleted, you will no longer receive email from that location "
      
      redirect_to :action => 'index', :id => info.id
    end
        
    
    if logged_in?
      ticket.destroy if user == current_user
    end #  if logged_in?    
    
  end
  
  protected
end