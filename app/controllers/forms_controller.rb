class FormsController < ApplicationController
  layout "users", :except => [:spam_survey, :report_spam, :test, :ie, :ie2, :test2, :HEY, :optional]
  
  # Be sure to include AuthenticationSystem in Application Controller instead
  
  ## sudo god -c ./config/fetcher-daemon.god -D
  ## check for logged in and user before viewing mail and deleting !!
  
  def send_secure_form
    
     flash[:error] = ""
     
    form_id = params[:form][:form_id]
    from_email = params[:form][:email]||" "
    message = params[:form][:comment]
   
    
    if message == nil || message.strip.empty? 
      flash[:error] += "- Please enter in a Message to Send <br />"
    end
    
    
   
    
    if simple_captcha_valid?
    #  render :text => "workz foo"

    
      session[:count] = 0
      session[:count] = session[:count]||0
      session[:count] += 1 
      
        if session[:count] > 10
          flash[:error]  += "- We don't spam you, please don't spam us. Relax, lay off  
                                for a while and try again later! <br />"
          
        else
          MyMailer.deliver_forward_form(form_id, from_email, message)    
        
    
    

       end
     

    else
      puts "hey the captcha isn't right ++++++++++++++++++"
        flash[:error]  += "- Please Try Copying the Text from the Image Again <br />"
      
    end
    
    

    
    #  flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    
      
      puts "================="
    redirect_to :back
   
    
  end
  
  def show
    # zq
      @crypt = params[:id]
      form = Forms.find_by_crypt(@crypt)
      @form_data = form.first
  end
  
  def create
    email = params[:form][:email]||" "
    comments = params[:form][:comment]
    @form = Forms.new(:email => email, :comments => comments)
    @rendered = true
    
    if simple_captcha_valid?
    #  render :text => "workz foo"
    @extra_message  = nil
    @no_spam = nil
    session[:count] = 0
      session[:count] = session[:count]||0
      session[:count] = session[:count] + 1 
        if session[:count] > 10
          @extra_message= "We don't spam you, please don't spam us.<br /> 
                                Relax, lay off for a while and try again later!"
        else
          puts "less than 10"
        the_user = User.find_by_email(email).first||User.create_by_email(email)
        puts the_user.class
        the_form  = the_user.forms.find(:first, :conditions => ["comments = ?", comments])
    
          if the_form == nil && the_user.valid?
            puts "hey there"            
            the_form = the_user.forms.create_with_cryptform(email, comments)
            @no_spam = the_form.crypt_form
          else
            @extra_message = "You already have an email on 
                              file for this comments/email combo, btw" if the_form != nil 
            @extra_message = "There were errors with your Email Address. Please try Again" if !the_user.valid?
          end ## if user_info == nil
       end
     
       @extra_message = "We have a hard time forwarding emails to blank addresses, 
                             please fill in the form" if email.strip == ""

        @no_spam = "www.whyspam.me/forms/show" + the_form.crypt_form if the_form != nil
    puts @no_spam
    else
      @extra_message = "Please Try Copying the Text from the Image Again" 
    end
    
    
    render :partial => "partials/forms/form_partial" 
   # render :text => "blob"
  end
  

 # def show
 #   # if User.current_user.logged_in?
 #   if logged_in?
 #     ticket_id = params[:id]
 #     @ticket = Ticket.find(:first, :include => [:info => :user], :conditions => ["id = ?", ticket_id])
 #       render :partial => "partials/tickets/show" if @ticket.info.user == current_user
 #     end #  if logged_in?
 # end
  
  def destroy
    
    if logged_in?
      puts "===================="
      ticket_id = params[:id]
      ticket = Ticket.find(:first, :include => [:info => :user], :conditions => ["id = ?", ticket_id])
      ticket.destroy if ticket.info.user == current_user
      end #  if logged_in?    
    
    redirect_to :back
  end
  
  protected
  



end