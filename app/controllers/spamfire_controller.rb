class SpamfireController < ApplicationController
layout "spamfire"



def index
  unless current_user.nil?
    user = current_user
    @whymails = user.whymail
  end
end

def new
  #http://localhost:3000/spamfire/new?website=http://blah.com&email=asdlfkj
  website = params[:website]||"Example.com"
#  email = params[:email]||cookies[:email]||""  
  email =  current_user.nil?  ?  "Your Email" : current_user.email  
  @checked = cookies[:checked]||"true"
  @user = User.new(:email => email, :website => Cleanurl.sanatize(website)) 
  @website = Website.find_or_create_by_url(website)
end


def create
  atAddress = params[:addrs]||"@whyspam.me"
  session[:count] = session[:count]||0
  @email = email = params[:user][:email]||0

   
  website = site = params[:user][:website]||" "
  session[:count] = 0 if ENV['RAILS_ENV'] == 'development'
  session[:count] = session[:count] + 1 
    
     if session[:count] > 50 && ENV['RAILS_ENV'] != "development" 
       @extra_message = configatron.session_count_error_small
       @whymail = Whymail.new
     else
       @whymail = "Email Server is down for good" || Whymail.create_with_user(email, website, atAddress)
       @extra_message = configatron.bad_email_small if @whymail.user.nil?
    end                          
  
end

end
