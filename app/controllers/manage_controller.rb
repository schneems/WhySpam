class ManageController < ApplicationController
   
   
   
   
  def index
     if current_user 
      @user = User.find(:first, :include => [:whymail => :tickets, :forms => :tickets], :conditions => {:id => current_user })
      @whymails = @user.whymail
      @forms = @user.forms
      else
        flash[:error]  = configatron.please_login
        redirect_to login_path
      end
  end
  
  
  def show
     id = params[:id]
     @type = params[:type]
     if @type.downcase == "whymail"
       @whymail = Whymail.find(:first, :include => [:tickets, :user], :conditions => ["id = ?", id], :order => "created_at DESC")
     else
       @whymail = Forms.find(:first, :include => [:tickets, :user], :conditions => ["id = ?", id], :order => "created_at DESC")       
      end      
       @tickets = @whymail.tickets
    if @whymail.user.nil? || @whymail.user != current_user
      @tickets = nil
      @whymail = nil
      redirect_to login_path
      flash[:error] = configatron.bad_permissions
    end
  end
  
  
end
