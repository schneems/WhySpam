class MyMailer < ActionMailer::Base
  
  
  
# sudo god -c ./config/fetcher-daemon.god -D  
  def forward_form(form_id, from_email, message) 
    form =  Forms.find(form_id)
    to_email = form.email
    from_email = from_email.strip.empty? ? 'noEmailWasGiven@whyspam.me' : from_email
    ticket = Ticket.find(:first, :conditions => {:from_email => from_email, :to_email => to_email, :body => message})        
    if ticket.nil?
      ticket = Ticket.create(:from_email => from_email, :to_email => to_email, :body => message, :subject => "Form Forwarded by WhySpam", :forms_id => form_id)
      if !to_email.nil?
        @recipients   = to_email
        @from         = from_email 
        headers         "Reply-to" => from_email
        @subject      = "Form Forwarded by WhySpam"
        @sent_on      = Time.now
        @content_type = "text/html"
        body[:address] = form.address
        body[:message] = message
      end
    end    
  end
  
  
  
  def receive(email) 
    from_email   = email.from[0]
    to_email     = email.to[0]
    message      = email.body
    subject      = email.subject
    ticket = Ticket.find(:first, :conditions => {:from_email => from_email, :to_email => to_email, :body => message})||Ticket.create(:subject => subject, :from_email => from_email, :to_email => to_email, :body => message)
 end
 
 
 #def forgot_password(user) ## will use this
 #  @recipients   = user.email
 #  body[:password] = user.new_random_password
 #  user.save
 #  @from         = "postmaster@whyspam.me" 
 #  headers        "Reply-to" => "DoNotReply@whyspam.me"
 #  @subject      = 'You have requested to change your password'
 #  @content_type = "text/html"
 #end
 
  
  def forward(to_email, from_email, email, subject, message)
    @recipients   = to_email
    @from         = from_email 
    headers        "Reply-to" => from_email
    @subject      = subject
    @sent_on      = Time.now
    @content_type = "text/html"
    body[:email] = email
    body[:message] = message
    #body[:name]  = name
    #body[:email] = email       
  end
   
   
  


  
  def sample(to_email)
    @recipients   = to_email
    @from         = "ArubyOnRailsProcess@mycomputer.com" 
    headers         "Reply-to" => "ArubyOnRailsProcess@mycomputer.com"
    @subject      = "This is a subject line someone would send"
    @sent_on      = Time.now
    @content_type = "text/html"
  end
  

   
   protected

     

end
