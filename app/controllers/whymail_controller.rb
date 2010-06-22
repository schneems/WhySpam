class WhymailController < ApplicationController
  
  
  
  def index
    @user = User.new
    # Abingo.options[:enable_specification] = true 
    # params[:video] = false
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
              @whymail = Whymail.create_with_user(email, website, atAddress)
          #   bingo!("video") if @whymail.valid?
              
          end
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
