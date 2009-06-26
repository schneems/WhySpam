class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  
  ## sudo god -c ./config/fetcher-daemon.god -D
  ## check for logged in and user before viewing mail and deleting !!
  
  
  # =begin
  #   TODO Add an auto complete to website input field of Secure Email
  #   TODO Stuff
  # =end
  
  
  include SimpleCaptcha::ControllerHelpers
  
  layout "users", :except => [:spam_survey, :report_spam, :test, :ie, :ie2, :test2, :HEY, :optional]

  
    def index
      
      @users = User.new

    end
  
  
  
    def generate_form
      email = params[:user][:email]
      email = params[:user][:comments]
      crypt_form = create_form_digest(email, comments)   
    
      @address = 'www.whyspam.me/secure/#{cryptform}/'
      ## = "<a href = 'http://#{@address}' >#{@address}</a>"
    
    end
  
  
     def create_form_digest(email, comments)   
       cryptmail = Digest::SHA1.hexdigest(email+comments)    
       guess = cryptmail
      if Info.cryptmail(guess) == []
        # return guess
      else
          count = 0
          while Info.cryptmail(guess) != []
            count = count+1
            guess = Digest::SHA1.hexdigest(guess+count.to_s)
          end # while 
      end ## first if
      return guess
    end # def
  
  
   def no_spam ## uh yeah, this is the real no spam
     session[:count] = session[:count]||0
   
     email = params[:user][:email]
     site = params[:user][:website]||" "
 
      @extra_message  = nil
      @no_spam = nil
       session[:count] = session[:count] + 1 
       if session[:count] > 10
         @extra_message= "We don't spam you, please don't spam us.<br /> 
                               Relax, lay off for a while and try again later!"
       else
       the_user = User.find_by_email(email).first||User.create_by_email(email)
       
       user_info = the_user.info.find(:first, :conditions => ["website = ?", site])
     
         if user_info == nil && the_user.valid?
           digest = create_digest(email, site)   
           user_info = the_user.info.create(:website => site, :cryptmail => digest.upcase + "@whyspam.me")
         else
            @extra_message = "You already have an email on 
                              file for this website/email combo, btw" if user_info != nil 
            @extra_message = "There were errors with your Email Address. Please try Again" if !the_user.valid?
         end ## if user_info == nil
      end

      @extra_message = "We have a hard time forwarding emails to blank addresses, 
                            please fill in the form" if email.strip == ""
                            
      @no_spam =  user_info.cryptmail.upcase if user_info != nil ##"@whyspam.me"
      
      respond_to do |format|
        format.html {render :partial => "partials/users/secure_email"}        
        format.js { render :partial => "partials/users/secure_email" }
     end
     
   end
 
 
 
   
    def privacy
      render :partial => "partials/users/privacy"
    end  
    
    def optional
      render :partial => "partials/users/optional"
    end  
 
    def read_slop
      flash[:error] = ""
    #  @ticket = Ticket.first
    #  puts @ticket.valid?
      if simple_captcha_valid?
        to_email = params[:ticket][:to_email]
        
        email_length = to_email.scan(/[\w.]+@/)[0].to_s.size
        @tickets = Ticket.find(:all, :conditions => ["to_email = ?", to_email])
        info = Info.find(:first, :conditions => ["cryptmail = ?", cryptmail])
         
        
          if !@tickets[0].nil? and !info.nil?
            puts "view all spam"
            @tickets = Array(@ticket)
            flash[:error]  += "- This is an address that may be used by a WhySpam Secure Email in the future, <br /> to ensure that you never pick a WhySpam Secure email by accident, always pick a url that does not equal 20 characters such as:  1#{to_email}<br />" if email_length == 21
            render :action => "view_all_spam"
          else 
            puts "what???????????????????"
            flash[:error]  += "- This is an address used by WhySpam Secure Email, <br /> to ensure that you never pick a WhySpam Secure email by accident, always pick a url that does not equal 20 characters such as:  1#{to_email}<br />" if info.nil?
            flash[:error]  += "- We haven't received any email at this email address, please try again later. <br />" if @tickets[0].nil?
            redirect_to :back
          end
          
          
        else
          flash[:error]  += "- The Text from the Image did not Match the text, please try again <br />"
          redirect_to :back
      end
      

    end  
    
    
 
    def read_spam
      ticket_id = params[:ticket]
      @ticket = Ticket.find(:first,  :conditions => ["id = ?", ticket_id])
      render :partial => "partials/users/read_spam"
    end
 
 
 
    def view_all_spam
      info_id = params[:info]
      @info = Info.find(:first, :include => :tickets, :conditions => ["id = ?", info_id], :order => "created_at DESC")
      
      @tickets = @info.tickets
    end
  
    # whatif you could give out your email address to website without worrying about getting spam, 
 
 
  
    def spam_survey
      info_id = params[:info]
      @info = Info.find(:first, :include => [:tickets, :user] , :conditions => ["id = ?", info_id] )
      @website = @info.website
      site = Website.find(:first, :conditions => ["url = ?", @website]  )||Website.create(:url => @website)
      @survey = site.surveys.create(:opt_out => "false", :un_solicited=> "false", :sell=> "false", :vulgar=> "false", :give_out=> "false")
      @user = @info.user
    end
  
    def report_spam
      info_id = params[:info]
      @info = Info.find(:first, :include => :tickets, :conditions => ["id = ?", info_id])
      @tickets = @info.tickets
    end
  
    def manage
    
    
      if logged_in?
        #@info = user.info
      @infos = current_user.info
      else
        flash[:error]  = "Please Login First"
        # redirect_back_or_default("new") 
      
        redirect_back_or_default :controller => 'sessions', :action => 'new'
      end
    end
  
  
    def whyspam
      @user = User.new
    
    end
  
 
  
   def create_digest(email, site)   
     cryptmail = Digest::SHA1.hexdigest(email+site)    
     guess = cryptmail[0,20]
    if Info.cryptmail(guess) == []
      # return guess
    else
      guess = cryptmail[20,20]
         
      if Info.cryptmail(guess) == []
        # return guess
      else
        count = 0
        while Info.cryptmail(guess) != []
          count = count+1
          guess = Digest::SHA1.hexdigest(guess+count.to_s)[0,20]
        end # while 
      end # second if
    end ## first if
       return guess
   end # def
 
 
   def no_spam_2
     email = ""
   
       @user = User.create(:email => email, :login => email, :password => email, :password_confirmation => email)
          puts "++++++++++++++++++++++++++++++++++++++++++++++++"
         # puts @user.errors
         @no_spam = "A1J2K3L4K3J2IFISOS8S@WhySpam.Me"
         @extra_message = "You already have an email on file for this website/email combo, btw"
 
       respond_to do |format|
         format.html {}        
         format.js { render :partial => "partials/users/secure_email" }
        ## render :text => "#{@user.errors}"
      end
   end
 
 
 
 
 
 
 
   # render new.rhtml
   def new
     @user = User.new
   end
 
   def create
     logout_keeping_session!
     @user = User.new(params[:user])
     success = @user && @user.save
     if success && @user.errors.empty?
             # Protects against session fixation attacks, causes request forgery
       # protection if visitor resubmits an earlier form using back
       # button. Uncomment if you understand the tradeoffs.
       # reset session
       self.current_user = @user # !! now logged in
       redirect_back_or_default('/')
       flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
     else
       flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin"
       render :action => 'new'
     end
   end
 
 
 
 
 
 
 
 
end
