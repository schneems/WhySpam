class MyMailer < ActionMailer::Base
  
  include Cleanurl
  
  def receive(email) 
    Ticket.find_or_create_and_send(email)
  end
  
  
  def forward(to_email_address, whymail_address, email)
    
    @recipients   = to_email_address
    @from         = "autoMailer@whyspam.me"
    headers         "Reply-to" => email.from.first
    @subject      = email.subject
    @sent_on      = Time.now
    @email        = whymail_address
    @content_type = "multipart/alternative" 
    
    plainPart = htmlPart = nil
    #check incoming message if it contained plain or html, sends the appropriate messages
      email.parts.each do |origPart|        
        plainPart = origPart.body if origPart.content_type == "text/plain"
        htmlPart = origPart.body if origPart.content_type == "text/html"
      end
    
      part "text/plain" do |p|
          p.body = render_message("forward.text.plain.erb", :message => plainPart) unless plainPart.nil?  
      end
      
      part "text/html" do |p|
          p.body = render_message("forward.text.html.erb", :message => htmlPart) unless htmlPart.nil? 
          p.body = render_message("forward.text.html.erb", :message => email.body.to_s) if htmlPart.nil? && plainPart.nil? 
      end

      
      

    #takes attachments and re-sends them
    if email.has_attachments?
      email.attachments.each do |origAttachment|
        attachment :filename => origAttachment.original_filename , :content_type => origAttachment.content_type.to_s ,  :body => origAttachment.read
      end
    end
  end
  
  
  
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
  

  
  
  
#  def receive(email) 
#
#    
#    from_email   = email.from[0]
#    to_email     = email.to[0] 
#    message      = email.body 
#    subject      = email.subject 
#    
#    
#    
#    Ticket.find(:first, :conditions => {:from_email => from_email, :to_email => to_email, 
#                :body => message})||Ticket.create(:subject => subject, :from_email => from_email, 
#                :to_email => to_email, :body => message, :body_hash => Digest::SHA1.hexdigest(message))
#    
#    
# end
 

  
  
  
 # def forward(to_email, from_email, email, subject, message)
 #   
 #   
 #   @recipients   = to_email
 #   @from         = "autoMailer@whyspam.me"
 #   headers        "Reply-to" => from_email
 #   @subject      = subject
 #   @sent_on      = Time.now
 #   @content_type = "text/html"
 #   body[:email] = email
 #   body[:message] = message
 #   #body[:name]  = name
 #   #body[:email] = email       
 # end
   
   
  


  
  def sample(to_email)
    @recipients   = to_email
    @from         = "canary@whyspam.me" 
    headers         "Reply-to" => "canary@whyspam.me"
    @subject      = "This is a subject line someone would send"
    @sent_on      = Time.now
    @content_type = "text/html"
  end
  
  
  def warning(to_email)
    @recipients   = to_email
    @from         = "omfgsomethingwentwrong@whyspam.me" 
    headers         "Reply-to" => "omfgsomethingwentwrong@whyspam.me"
    @subject      = "Hey Admin, do something"
    @sent_on      = Time.now
    @content_type = "text/html"
  end
  

   
   protected

     

end
