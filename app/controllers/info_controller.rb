class InfoController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  
  ## sudo god -c ./config/fetcher-daemon.god -D
  ## check for logged in and user before viewing mail and deleting !!
  layout "users", :except => [:spam_survey, :report_spam, :test, :ie, :ie2, :test2, :HEY, :optional]
  

  
  
  def index
    if logged_in? 
      #@info = user.info
    @user = User.find(:first, :include => [:info => :tickets, :forms => :tickets], :conditions => {:id => current_user })
    @infos = @user.info
    @forms = @user.forms
    else
      flash[:error]  = "Please Login First"
      # redirect_back_or_default("new") 
      redirect_to login_path
      #redirect_to :controller => 'sessions', :action => 'new'
    end
  end
  

 # def index
 #   # if User.current_user.logged_in?
 #   if logged_in?
 #     info_id = params[:id]
 #     @info = Info.find(:first, :include => [:user => :forms], :conditions => ["id = ?", info_id])
 #     
 #     redirect_to view_all_spam_url(:info => @info.id) if @info.user == current_user
 #     
 #     end #  if logged_in?s
 # end
  
  def destroy
    if logged_in?

     if @info.user == current_user
     end #  if logged_in?    
    
    redirect_to :back
    end
  end  
  
  




end