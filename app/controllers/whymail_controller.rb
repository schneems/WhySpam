class WhymailController < ApplicationController
  
  def index
  end
   
   def create 
     ## the reason for this nasty nested if/else structure is to deliver error messages to the user when using remote_form
     ## can most likely be simplified
       session[:count] = session[:count]||0
       @email = email = params[:user][:email]
       puts @email
        site = params[:user][:website]||" "        
        @secure_email = @extra_message = nil
        session[:count] +=  1 
          
          if session[:count] > 10 && ENV['RAILS_ENV'] != "development"
            @extra_message = configatron.session_count_error
          else
            the_user = User.find_or_create_by_email(email)
            secure_email = the_user.whymail.find(:first, :conditions => ["website = ?", site])
            
              if secure_email == nil && the_user.valid?
                digest = User.create_digest(email, site)   
                secure_email = the_user.whymail.create(:website => site, :email => digest.upcase + "@WHYSPAM.ME")
              else
                 @extra_message = configatron.duplicate_email if secure_email != nil 
                 @extra_message = configatron.bad_email if !the_user.valid?
              end ## if secure_email == nil
           end
         #  @extra_message = "We have a hard time forwarding emails to blank addresses, 
         #                        please fill in the form" if email.strip == ""
           @secure_email =  secure_email.email.upcase if secure_email != nil ##"@whyspam.me"
           
           render :partial => "create" 

   end
  

 def destroy
   @whymail = Whymail.find(:first, :joins => [:user], :conditions => ["id = ?", params[:id] ])
    if @whymail.user == current_user
      @whymail.destroy
    end #  if current_user    
   redirect_to :back   
 end 

  
end
