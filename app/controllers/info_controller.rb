class InfoController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  
  ## sudo god -c ./config/fetcher-daemon.god -D
  ## check for logged in and user before viewing mail and deleting !!
  

  

  def show
    # if User.current_user.logged_in?
    if logged_in?
      info_id = params[:id]
      @info = Info.find(:first, :include => :user, :conditions => ["id = ?", info_id])
      puts @info.id
      puts @info.user
      redirect_to view_all_spam_url(:info => @info.id) if @info.user == current_user
      end #  if logged_in?
  end
  
  def destroy
    if logged_in?

     if @info.user == current_user
     end #  if logged_in?    
    
    redirect_to :back
    end
  end  
  
  




end