class TestMailer < ActionMailer::Base
  
  
  
    def receive(email) 
      Ticket.find_or_create_and_send(email)
     # TestMailer.deliver_forward("thedickster@gmail.com", email)
    end


  def forward(to_email, email)
    
    @recipients   = to_email
    @from         = "autoMailer@whyspam.me"
    headers         "Reply-to" => email.from.first
    @subject      = email.subject
    @sent_on      = Time.now
    
    #check incoming message if it contained plain or html, sends the appropriate messages
    email.parts.each do |receivePart|
        if receivePart.content_type == "text/plain"
            part "text/plain" do |p|
                p.body = render_message("forwardPLAIN", :message => receivePart.body)
            end
        elsif receivePart.content_type == "text/html" || receivePart.content_type == "multipart/alternative"
            part "text/html" do |p|
                p.body = render_message("forwardHTML", :message => receivePart.body)
                
            end 
        end
    end

    $has_attachment = email.has_attachments? if RAILS_ENV == "test" ## this is a hack added for testing purposes
    #takes attachments and re-sends them
    email.attachments.each do |receiveAttachment|
      attachment :content_type => receiveAttachment.content_type.to_s ,  :body => receiveAttachment.read
    end
  end
  
  def sendMultipleAttachments(to_email)
    @recipients   = to_email
    @from         = "attachMultipleTest@whyspam.me"
    headers         "Reply-to" => "canary@whyspam.me"
    @subject      = "This is a subject line someone would send"
    @sent_on      = Time.now
    content_type    "multipart/alternative"
    
    
    part "text/html" do |p|
      p.body = render_message("sendattachmentHTML", :message => "This Is a message")
    end

    part "text/plain" do |p|
      p.body = render_message("sendattachmentPLAIN", :message => "This Is a message")
    end
    
    attachment :content_type => "image/png",  :body => File.read("/Users/richardschneeman/Documents/rails/whyspam/public/images/blog.png") 
    attachment :content_type => "image/png",  :body => File.read("/Users/richardschneeman/Documents/rails/whyspam/public/images/email.png") 
    attachment :content_type => "image/png",  :body => File.read("/Users/richardschneeman/Documents/rails/whyspam/public/images/WhyLogo.png") 
    
  end

  def sendAttachment(to_email) ## attachments must specify part
    @recipients   = to_email
    @from         = "attachTest@whyspam.me"
    headers         "Reply-to" => "canary@whyspam.me"
    @subject      = "This is a subject line someone would send"
    @sent_on      = Time.now
    content_type    "multipart/alternative"
    
    part "text/html" do |p|
      p.body = render_message("sendattachmentHTML", :message => "This Is a message")
    end

    part "text/plain" do |p|
      p.body = render_message("sendattachmentPLAIN", :message => "This Is a message")
    end
    
    attachment :content_type => "image/png",  :body => File.read("/Users/richardschneeman/Documents/rails/whyspam/public/images/blog.png") 


  end

  def mime(to_email)
    @recipients   = to_email
    @from         = "mimeTest@whyspam.me"
    headers         "Reply-to" => "canary@whyspam.me"
    @subject      = "This is a subject line someone would send"
    @sent_on      = Time.now
    body[:message]  = "This Is a message"
  end
  

     
     




    

    
    def multipleAttachments(email)
      
    end
    


 #  class MyMailer < ActionMailer::Base
 #
 #  ## current problems 
 #  ## will not recognize to'd, CC'd,  or BC'd emails; 
 #  ## turns text emails into text/html emails
 #  ## crushes mime emails into mime+html emails
 #  ## drops attachments
 #
 #
 #  # sudo god -c ./config/fetcher-daemon.god -D  
 #    def forward_form(form_id, from_email, message) 
 #      form =  Forms.find(form_id)
 #      to_email = form.email
 #      from_email = from_email.strip.empty? ? 'donotreply@whyspam.me' : from_email
 #      ticket = Ticket.find(:first, :conditions => {:from_email => from_email, :to_email => to_email, :body => message})        
 #      if ticket.nil?
 #        ticket = Ticket.create(:from_email => from_email, :to_email => to_email, :body => message, :subject => "Form Forwarded by WhySpam", :forms_id => form_id)
 #        if !to_email.nil?
 #          @recipients   = to_email
 #          @from         = "autoMailer@whyspam.me" 
 #          headers         "Reply-to" => from_email
 #          @subject      = "Form Forwarded by WhySpam"
 #          @sent_on      = Time.now
 #          @content_type = "text/html"
 #          body[:address] = form.address
 #          body[:message] = message
 #        end
 #      end    
 #    end
 #
 #
 #
 #
 #
 #
 #    def receive(email) 
 #      ## should check all to's, cc's, bcc's for a @whyspam.me
 #
 #      from_email   = email.from[0]
 #      to_email     = email.to[0] 
 #      message      = email.body 
 #      subject      = email.subject 
 #
 #
 #
 #
 #
 #      Ticket.find(:first, :conditions => {:from_email => from_email, 
 #                :to_email => to_email, :body => message})||Ticket.create(:subject => subject, 
 #                :from_email => from_email, :to_email => to_email, 
 #                :body => message, :body_hash => Digest::SHA1.hexdigest(message) )
 #
 #
 #
 #   end
 #
 #
 #   #def forgot_password(user) ## will use this
 #   #  @recipients   = user.email
 #   #  body[:password] = user.new_random_password
 #   #  user.save
 #   #  @from         = "postmaster@whyspam.me" 
 #   #  headers        "Reply-to" => "DoNotReply@whyspam.me"
 #   #  @subject      = 'You have requested to change your password'
 #   #  @content_type = "text/html"
 #   #end
 #
 #
 #
 #
 #      include Cleanurl
 # 
 #      def forward(to_email, from_email, email, subject, message)    
 #        @recipients   = to_email
 #       # @from         = find_from_url(from_email)+"@whyspam.me" 
 #        @from         = "autoMailer@whyspam.me" 
 #        headers        "Reply-to" => from_email
 #        @subject      = subject
 #        @sent_on      = Time.now
 #        @content_type = "text/html"
 #        body[:email] = email
 #        body[:message] = message  
 #      end
 # 
 # 
 # 
 #      def test_attachment(to_email)
 #        @recipients   = to_email
 #        @from         = "canary@whyspam.me" 
 #        headers         "Reply-to" => "canary@whyspam.me"
 #        @subject      = "This is a subject line someone would send"
 #        @sent_on      = Time.now
 #        body[:message] = "This Is a message"
 #        attachment :content_type => "image/png",  :body => File.read("/Users/richardschneeman/Documents/rails/whyspam/public/images/blog.png") 
 # 
 #      end
 # 
 #      def sample_mime(to_email)
 #        @recipients   = to_email
 #        @from         = "canary@whyspam.me" 
 #        headers         "Reply-to" => "canary@whyspam.me"
 #        @subject      = "This is a subject line someone would send"
 #        @sent_on      = Time.now
 #        body[:message] = "This Is a message"
 # 
 # 
 #        part :content_type => "text/html",
 #          :body => render_message("sample_mime_test", :message => "This Is a Message")
 # 
 #        part "text/plain" do |p|
 #          p.body = render_message("sample_mime_test", :message => "This Is a Message")
 #          p.transfer_encoding = "base64"
 #        end
 # 
 # 
 #      end
 # 
 #      def sample(to_email)
 #        @recipients   = to_email
 #        @from         = "canary@whyspam.me" 
 #        headers         "Reply-to" => "canary@whyspam.me"
 #        @subject      = "This is a subject line someone would send"
 #        @sent_on      = Time.now
 #        @content_type = "text/html"
 #      end
 # 
 # 
 #      def warning(to_email, message)
 #        @recipients   = to_email
 #        @from         = "omfgsomethingwentwrong@whyspam.me" 
 #        headers         "Reply-to" => "omfgsomethingwentwrong@whyspam.me"
 #        @subject      = "Hey Admin, do something"
 #        @sent_on      = Time.now
 #        body[:message] = message
 #      end
 # 
 # 
 # 
 #       protected
 # 
 # 
 # 
 #    end
 # 
    
    
end