class TicketsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  
  ## sudo god -c ./config/fetcher-daemon.god -D
  ## check for logged in and user before viewing mail and deleting !!
  

  

  def show
    # if User.current_user.logged_in?
    if logged_in?
      ticket_id = params[:id]
      @ticket = Ticket.find(:first, :include => [:info => :user], :conditions => ["id = ?", ticket_id])
        render :partial => "partials/tickets/show" if @ticket.info.user == current_user
      end #  if logged_in?
  end
  
  def destroy
    
    if logged_in?
      puts "===================="
      ticket_id = params[:id]
      ticket = Ticket.find(:first, :include => [:info => :user], :conditions => ["id = ?", ticket_id])
      ticket.destroy if ticket.info.user == current_user
      end #  if logged_in?    
    
    redirect_to :back
  end
  
  protected
  



end