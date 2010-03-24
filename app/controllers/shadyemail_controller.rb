class ShadyemailController < ApplicationController
  
  layout nil
  
  
  def index
    @user = User.new
  end
  
  def create 
       atAddress = params[:addrs]||"@whyspam.me"
       session[:count] = session[:count]||0
       @email = email = params[:user][:email]
       website = params[:user][:website]||" "        
       @secure_email = @extra_message = nil
       session[:count] +=  1 
         if session[:count] > 50 && ENV['RAILS_ENV'] != "development"
             @extra_message = configatron.session_count_error
             @whymail = Whymail.new
         else
             @whymail = Whymail.create_with_user(email, website, atAddress, :category => "shady")
         end
       render :partial => "create" 
  end
  
  
  def update
    email = params[:user][:whymail]
    id = params[:user][:id].to_i
    atAddress = params[:addrs]
    user = User.find(:first, :conditions => ["id = ? ", id])
    whymail = user.whymail.find(:first, :conditions => ["email = ?", email ]) unless user.nil?
    if !whymail.nil?
      website = whymail.website
      whymail.destroy
      @whymail = Whymail.create_with_user(user.email, website||"", atAddress, :category => "shady")
    end
    sleep 1

    @replace_message = "Something went wrong" if @whymail.nil? || whymail.nil?
    @replace_message  = email.downcase + " was deleted "
    render :partial => "create" 
    
  end
  
  
end
