class TicketObserver < ActiveRecord::Observer 
  def after_create(ticket)  
    
    

    
#    
#    email = ticket.to_email.scan(/^[\w]+/)[0].to_s.downcase ## ass7s3j4028234723482918181 ...
#    # email = ticket.to_email[0,40].downcase
#    address = ticket.to_email.scan(/[\w.]+$/)[0].to_s.downcase ## @whyspam.me
#    info = Whymail.find(:first, :include => :user, :conditions => ["email = ?", email ])  
#    to_email = info.user.email
#    #email = "E23E13E76744A188860ABA7AC83DDA08B0D920AA"
#    # E23E13E76744A188860ABA7AC83DDA08B0D920AA@whyspam.me
#    #address = "whyspam.me"
#    
#    
#      #to_email = ticket.to_email
#    from_email =  ticket.from_email
#    subject = ticket.subject
#    message = ticket.body.to_s
#    
#    MyMailer.deliver_forward(to_email, from_email, email.to_s.upcase+"@"+ address.to_s, subject, message)
#    
    ## Hmm, So if i Send:
    # MyMailer.deliver_forward("xxx@gmail.com", "yousuck@mail.com", "E23E13E76744A188860ABA7AC83DDA08B0D920AA@address.com", "subject", "message")
    # Then I get exactly what i was expecting
    # 
    #If i send:
    # MyMailer.deliver_sample("E23E13E76744A188860ABA7AC83DDA08B0D920AA@whyspam.me")
    # MyMailer.deliver_welcome("Dick", email_to)
    
    
    #    "C7FDC3B1B31C51E64DCF@whyspam.me"
    # MyMailer.deliver_forward("xxx@gmail.com", "yousuck@mail.com", "C7FDC3B1B31C51E64DCF@address.com", "subject", "message")
    
  end
end 