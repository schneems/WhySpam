class Ticket < ActiveRecord::Base
  
  belongs_to :whymail
  belongs_to :forms
  
 # attr_accessible :to_email, :from_email, :subject, :body, :whymail_id, :body_hash
  
  
  validates_uniqueness_of   :to_email, :scope => [:body, :from_email]
  validates_presence_of     :to_email
  validates_presence_of     :from_email
  validates_presence_of     :subject
  validates_presence_of     :body
  

 
 
  def self.get_email_addresses(email)
    email_array = []
    email.to.uniq.each {|address| email_array << address unless address.match(/\@whyspam.me$|\@amilegit.com$/i).nil? } unless email.to.nil?
    email.cc.uniq.each {|address| email_array << address unless address.match(/\@whyspam.me$|\@amilegit.com$/i).nil? }  unless email.cc.nil?
    email.bcc.uniq.each {|address| email_array << address unless address.match(/\@whyspam.me$|\@amilegit.com$/i).nil? } unless email.bcc.nil?
    return email_array
  end
 
 
  def self.find_or_create_and_send(email)
    message = email.body
    email_addresses = Ticket.get_email_addresses(email)
    
    email_addresses.each do |to_email|
      whymail = Whymail.find(:first, :conditions => ['(email = ?)', to_email.upcase ] ) 
      @ticket = Ticket.create(:subject => email.subject, :from_email => email.from.first, :to_email => to_email, :whymail_id => whymail.id,
                                  :body => message ,  :body_hash => Digest::SHA1.hexdigest(message) ) unless whymail.nil?

                
      @ticket.send_email(email) unless @ticket.nil?
    end
    
    return @ticket
    
  end
    
    
  
  def send_email(email)
    if self.valid?
      newEmail = email
      newEmail.to = self.whymail.user.email      
      newEmail["Reply-To"] = email.from.first ## must come before newEmail.from
      
      Fwdemail.change_friendly_from( newEmail , "autoMailer@whyspam.me", :append_message => "     (Fwd: WhySpam.Me)")
      #     newEmail.from = '"MikelA@blah.com" <mikel@me.com>' #'"hello@hi.com"+"<autoMailer@whyspam.me>"' #Cleanurl.find_from_url(email.from.first) + " (Forwarded by WhySpam.Me) "  + "<autoMailer@whyspam.me>"  
      whymail_address = self.whymail.email
      plain = "______________________________________________________________
      Forwarded from WhySpam.Me: to block emails through #{whymail_address}, 
      go to http://www.whyspam.me/manage and delete this disposable address."
      html = "<div class = 'wrapper' style = 'min-height: 100%;	height: auto !important;height: 100%;margin: 0 auto -142px;'>
                <div class = 'push' style = 'height: 142px;'> &nbsp</div>
              </div><!-- wrapper -->
              <div class = 'footer' style = 'height: 142px;height:100%; color:black; background-color:white;' >                      
                <hr />
                <p>Forwarded from WhySpam.Me: to block emails through #{whymail_address}
                go to <a href = 'http://www.whyspam.me/manage'>Manage Emails</a> and delete this disposable address.</p>
              </div>"

      Fwdemail.appendfooter(newEmail, {:html => html, :plain => plain} )
      
      MyMailer.deliver(newEmail)  # MyMailer.deliver_forward(self.whymail.user.email, whymail_address, email)  
    end
  end
  



    

  

    
end
