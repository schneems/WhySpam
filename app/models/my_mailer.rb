class MyMailer < ActionMailer::Base


  def sample(to_email)
    @recipients   = to_email
    @from         = "ArubyOnRailsProcess@mycomputer.com" # params[:contact][:email]
    headers         "Reply-to" => "ArubyOnRailsProcess@mycomputer.com"
    @subject      = "This is a subject line someone would send"
    @sent_on      = Time.now
    @content_type = "text/html"
  end
  
    
  
  def forward_form(form_id, from_email, message) 
    
    form =  Forms.find(form_id)
    to_email = form.email
    ticket = Ticket.find(:first, :conditions => {:from_email => from_email, :to_email => to_email, :body => message})        
    if ticket == nil
      ticket = Ticket.create(:from_email => from_email, :to_email => to_email, :body => message, :subject => "Form Forwarded by WhySpam", :form_id => form_id)
      if to_email != nil
        puts "==============WORKED=============="
        puts "to_email #{to_email}"
        puts "from_email #{from_email}"
        
        @recipients   = to_email
        @from         = from_email # params[:contact][:email]
        headers         "Reply-to" => from_email
        @subject      = "Form Forwarded by WhySpam"
        @sent_on      = Time.now
        @content_type = "text/html"
        
        body[:crypt_form] = form.cryptmail
        body[:message] = message

      end
    
    end
    
    
  end
  
  
  
  def receive(email) 
    from_email   = email.from[0]
    to_email     = email.to[0]
    message      = email.body
    subject      = email.subject
    ticket = Ticket.find(:first, :conditions => {:from_email => from_email, :to_email => to_email, :body => message})        
    
        if ticket == nil
          cryptmail = to_email.scan(/^[\w]+/)[0].to_s.downcase ## ass7s3j4028234723482918181 ...
            # cryptmail = ticket.to_email[0,40].downcase
          address = to_email.scan(/@[\w.]+$/)[0].to_s.downcase ## @whyspam.me
          info = Info.find(:first, :include => :user, :conditions => ['(cryptmail = ?)', to_email.upcase ] ) # looks up user info profile
          ticket = Ticket.create(:from_email => from_email, :to_email => to_email, :body => message, :subject => subject, :info_id => info.id)||Ticket.create(:from_email => from_email, :to_email => to_email, :body => message, :subject => subject)
      
          to_email = info.user.email # gets actual "To:" email address
            
          #  my_mail = MyMailer.create_new_body(email.body, cryptmail + address )
          #  my_mail.to = to_email
          #  my_mail.subject = email.subject
          #  MyMailer.deliver(my_mail)
      
          if to_email != nil
            MyMailer.deliver_forward(to_email, from_email, cryptmail.to_s.upcase + address.to_s, subject, message)        
          end
      
         # MyMailer.deliver_sample("C7FDC3B1B31C51E64DCF@whyspam.me")
         ## sudo god -c ./config/fetcher-daemon.god -D
     
       # Ticket.all.each do |element|
       #    element.destroy
       #  end
   
       #  Ticket.all
        end

      
    #    MyMailer.deliver_forward("xxx@gmail.com", "yousuck@mail.com", "C7FDC3B1B31C51E64DCF@address.com", "subject", "message")
    #    MyMailer.deliver_sample("xxx@whyspam.me")
    # mail = MyMailer.create_sample("xxx@gmail.com")
    # 
          #   MyMailer.deliver_sample("xxxx@gmail.com")
        
        
    
 #   my_mail = MyMailer.create_new_body(email.body, "xxx@whyspam.me")
 #   my_mail.to = "xxx@gmail.com"
 #   my_mail.subject = email.subject
 #   
 #     #    my_mail.body = email.body + "<br /> Hey there"
 #   
 #   # my_mail.destinations = "xxx@gmail.com"
 #   MyMailer.deliver(my_mail)

 end
  
  def forward(to_email, from_email, cryptmail, subject, message)
    @recipients   = to_email
    @from         = from_email # params[:contact][:email]
    headers         "Reply-to" => from_email
    @subject      = subject
    @sent_on      = Time.now
    @content_type = "text/html"
    
    body[:email] = cryptmail
    body[:message] = message
    #body[:name]  = name
    #body[:email] = email       
  end
  
  
  
  
   def new_body(message, cryptmail)
     
     body[:email] = cryptmail
     body[:message] = message
     #body[:name]  = name
     #body[:email] = email   
   end
   
   
  
  def welcome(name, email)
    @recipients   = email
    @from         = "postmaster@whyspam.me" # params[:contact][:email]
    headers         "Reply-to" => "do_not_reply@whyspam.me"
    @subject      = "Welcome to Why Spam Me"
    @sent_on      = Time.now
    @content_type = "text/html"
    @name = name
    @email = "asdlkfjalskdfj"
    body[:name]  = name
    body[:email] = email       
  end



  

  
  # ========================================
  
   #def signup_notification(user)  ## don't want user to be bugged...maybe
   #  setup_email(user)
   #  @subject    += 'Please activate your new account'  
   #  @body[:url]  = "http://localhost:3000/activate/#{user.activation_code}"  
   #end
   
   #def activation(user)  ## don't need activation...maybe
   #  setup_email(user)
   #  @subject    += 'Your account has been activated!'
   #  @body[:url]  = "http://localhost:3000/"
   #end
   
   def forgot_password(user) ## will use this
     setup_email(user)
     @subject    += 'You have requested to change your password'
     @body[:url]  = "http://localhost:3000/reset_password/#{user.password_reset_code}"
   end
  
   def reset_password(user) ## want to notify of password reset
     setup_email(user)
     @subject    += 'Your password has been reset.'
   end
   
   protected
   #  def setup_email(user) ## nope
   #    @recipients  = "#{user.email}"
   #    @from        = "mail@yourapplication.com"
   #    @subject     = "YourApplication - "
   #    @sent_on     = Time.now
   #    @body[:user] = user
   #  end
     
     

end
