class MyMailer < ActionMailer::Base
  
# sudo god -c ./config/fetcher-daemon.god -D  
  def forward_form(form_id, from_email, message) 
    form =  Forms.find(form_id)
    to_email = form.email
    ticket = Ticket.find(:first, :conditions => {:from_email => from_email, :to_email => to_email, :body => message})        
    if ticket == nil
      ticket = Ticket.create(:from_email => from_email, :to_email => to_email, :body => message, :subject => "Form Forwarded by WhySpam", :forms_id => form_id)
      if to_email != nil        
        @recipients   = to_email
        @from         = from_email 
        headers         "Reply-to" => from_email
        @subject      = "Form Forwarded by WhySpam"
        @sent_on      = Time.now
        @content_type = "text/html"
        
        body[:crypt_form] = form.crypt_form
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
    info = Info.find(:first, :include => :user, :conditions => ['(cryptmail = ?)', to_email.upcase ] ) 
    
        if ticket == nil && info != nil
          cryptmail = to_email.scan(/^[\w]+/)[0].to_s.downcase ## ass7s3j4028234723482918181 ...
            # cryptmail = ticket.to_email[0,40].downcase
          address = to_email.scan(/@[\w.]+$/)[0].to_s.downcase ## @whyspam.me
          to_email = info.user.email # gets actual "To:" email address
          ticket = Ticket.create(:from_email => from_email, :to_email => to_email, :body => message, :subject => subject, :info_id => info.id)||Ticket.create(:from_email => from_email, :to_email => to_email, :body => message, :subject => subject)
          
          if to_email != nil && ticket.save
            MyMailer.deliver_forward(to_email, from_email, cryptmail.to_s.upcase + address.to_s, subject, message)        
          end
      
        elsif ticket == nil
          puts "this happens if only ticket == nil"
          Ticket.create(:from_email => from_email, :to_email => to_email, :body => message, :subject => subject)
        end

      
    #    MyMailer.deliver_forward("thedickster@gmail.com", "yousuck@mail.com", "C7FDC3B1B31C51E64DCF@address.com", "subject", "message")
    #    MyMailer.deliver_sample("C7FDC3B1B31C51E64DCF@uniteddictionary.com")
    # mail = MyMailer.create_sample("thedickster@gmail.com")
    # 
          #   MyMailer.deliver_sample("thedickster@gmail.com")
        
        
    
 #   my_mail = MyMailer.create_new_body(email.body, "C7FDC3B1B31C51E64DCF@address.com")
 #   my_mail.to = "thedickster@gmail.com"
 #   my_mail.subject = email.subject
 #   
 #     #    my_mail.body = email.body + "<br /> Hey there"
 #   
 #   # my_mail.destinations = "thedickster@gmail.com"
 #   MyMailer.deliver(my_mail)

 end
  
  def forward(to_email, from_email, cryptmail, subject, message)
    @recipients   = to_email
    @from         = from_email 
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
    @from         = "foo@example.com" 
    headers         "Reply-to" => "whateverIwantyouto@gmail.com"
    @subject      = "Welcome to Add Three"
    @sent_on      = Time.now
    @content_type = "text/html"
    @name = name
    @email = "asdfasdfasdfasdfasf@bobity.com"
    body[:name]  = name
    body[:email] = email       
  end



  
  def sample(to_email)
    @recipients   = to_email
    @from         = "ArubyOnRailsProcess@mycomputer.com" 
    headers         "Reply-to" => "ArubyOnRailsProcess@mycomputer.com"
    @subject      = "This is a subject line someone would send"
    @sent_on      = Time.now
    @content_type = "text/html"
  end
  
  
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
