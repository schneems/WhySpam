class SpamfireController < ApplicationController


def index
end

def new
  #http://localhost:3000/spamfire/new?website=http://blah.com&email=asdlfkj
  website = params[:website]||"Website"
  email = params[:email]||"Your Email"
    @user = User.new(:email => email, :website => website) 
end

def create
  
  session[:count] = session[:count]||0
   email = params[:user][:email]
  @website = site = params[:user][:website]||" "
session[:count] = 0
    @extra_message  = nil
    @no_spam = nil
     session[:count] = session[:count] + 1 
     if session[:count] > 10
       @extra_message= "Try Again Later"
     else
     the_user = User.find_by_email(email).first||User.create_by_email(email)
     
     user_info = the_user.info.find(:first, :conditions => ["website = ?", site])
   
       if user_info == nil && the_user.valid?
         digest = User.create_digest(email, site)   
         user_info = the_user.info.create(:website => site, :cryptmail => digest.upcase + "@whyspam.me")
       else
          @extra_message = "Bad Email, try Again" if !the_user.valid?
       end ## if user_info == nil
    end

    @extra_message = "Blank Email, try again" if email.strip == ""
                          
    @no_spam =  user_info.cryptmail.upcase if user_info != nil ##"@whyspam.me"
    
    respond_to do |format|
      format.html {render :partial => "secure_email"}        
      format.js { render :partial => "secure_email" }
   end
  
end

end
