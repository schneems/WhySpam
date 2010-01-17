class TicketsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  
  ## sudo god -c ./config/fetcher-daemon.god -D
  ## check for logged in and user before viewing mail and deleting !!
  
  ## ummm, you can manually go go http://localhost:3000/tickets/index/133 when you're not logged in...fix that
  
  ## command t finds file name in project...totally aweso
  
  
    
#  def show_all_tickets
#    whymail_id = params[:whymail]
#    @whymail = Whymail.find(:first, :include => :tickets, :conditions => ["id = ?", whymail_id], :order => "created_at DESC")
#    @tickets = @whymail.tickets
#  end

#  def show
#    # if User.current_user.current_user
#      if current_user
#        whymail_id = params[:id]
#        @whymail = Whymail.find(:first, :include => :user, :conditions => ["id = ?", whymail_id])
#      
#        redirect_to view_all_spam_url(:whymail => @whymail.id) if @whymail.user == current_user
#      end #  if current_users
#  end
  
  def show
    ticket_id = params[:id].to_i
    @ticket = Ticket.find(:first, :include => [:whymail => :user], :conditions => ["id = ?", ticket_id])
    if @ticket.whymail.nil? && @ticket.forms.nil? ## that means the ticket is slop, show show slop
      render :partial => "show"
      @user = nil      
    else ## that means the ticket is not slop slop
      @ticket.whymail.nil? ? @user = @ticket.forms.user : @user = @ticket.whymail.user 
        if current_user == @user
          render :partial => "show"
        else
          redirect_to :back
        end
    end
  end
  
  
  def destroy
    ticket_id = params[:id]
    ticket = Ticket.find(:first, :include => [:whymail => :user], :conditions => ["id = ?", ticket_id])||Ticket.find(:first, :include => [:forms => :user], :conditions => ["id = ?", ticket_id])
    whymail = ticket.whymail if ticket.whymail.nil?
    if ticket.whymail.nil?
      form = ticket.forms
      user = form.user
      flash[:notice] = "Form to " + forms_url + '/'+ form.address + " has been deleted"
      redirect_to :action => 'index', :id => form.id
    else
      whymail = ticket.whymail
      user = whymail.user
      flash[:notice] =  whymail.email + " has been deleted, you will no longer receive email from that location "
      redirect_to :action => 'index', :id => whymail.id
    end
            
    if current_user
      ticket.destroy if user == current_user
    end #  if current_user    
  end
  
  protected
end