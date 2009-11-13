class SpamfireController < ApplicationController
layout nil

def index
end



def new
  #http://localhost:3000/spamfire/new?website=http://blah.com&email=asdlfkj
  website = params[:website]||"Example.com"
  email = params[:email]||cookies[:email]||""  
  email = "Your Email" if email.strip.empty?
  @checked = cookies[:checked]
  @user = User.new(:email => email, :website => website) 
  
end


def create
  session[:count] = session[:count]||0
  @email = email = params[:user][:email]||0
   if params[:save][:checked] == "1"
     cookies[:email] = email 
     cookies[:checked] = "true"
     #"save"=>{"checked"=>"1"}
   else
     cookies[:checked] = "false"
     cookies[:email] = ""
   end
  @website = site = params[:user][:website]||" "
  session[:count] = 0 if ENV['RAILS_ENV'] == 'development'
  @secure_email =  @extra_message  = nil
     session[:count] = session[:count] + 1 
     if session[:count] > 10
       @extra_message = configatron.session_count_error_small
     else
     the_user = User.find_or_create_by_email(email)
     user_whymail = the_user.whymail.find(:first, :conditions => ["website = ?", site])
       if user_whymail == nil && the_user.valid?
         digest = User.create_digest(email, site)   
         user_whymail = the_user.whymail.create(:website => site, :email => digest.upcase + "@whyspam.me")
       else
          @extra_message = configatron.bad_email_small if !the_user.valid?
       end ## if user_whymail == nil
    end                          
    @secure_email =  user_whymail.email.upcase if user_whymail != nil ##"@whyspam.me"
    respond_to do |format|
      format.html {render :partial => "create"}        
      format.js { render :partial => "create" }
   end
  
end

end
