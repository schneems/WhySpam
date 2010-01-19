class SpamfireController < ApplicationController
layout nil

def index
end



def new
  #http://localhost:3000/spamfire/new?website=http://blah.com&email=asdlfkj
  website = params[:website]||"Example.com"
  email = params[:email]||cookies[:email]||""  
  email = "Your Email" if email.strip.empty?
  @checked = cookies[:checked]||"true"
  @user = User.new(:email => email, :website => Cleanurl.sanatize(website)) 
  @website = Website.find_or_create_by_url(website)
end


def create
  session[:count] = session[:count]||0
  @email = email = params[:user][:email]||0
  
   if params[:save][:checked] == "1"
     cookies[:email] = email 
     cookies[:checked] = "true"
   else
     cookies[:checked] = "false"
     cookies[:email] = ""
   end
   
  website = site = params[:user][:website]||" "
  session[:count] = 0 if ENV['RAILS_ENV'] == 'development'
  session[:count] = session[:count] + 1 
    
     if session[:count] > 10
       @extra_message = configatron.session_count_error_small
       @whymail = Whymail.new
     else
       @whymail = Whymail.create_with_user(email, website)
       @extra_message = configatron.bad_email_small if @whymail.user.nil?
    end                          

    respond_to do |format|
      format.html {render :partial => "create"}        
      format.js { render :partial => "create" }
   end
  
end

end
