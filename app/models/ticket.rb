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
    email.to.uniq.each {|address| email_array << address unless address.match(/\@whyspam.me$/i).nil? } unless email.to.nil?
    email.cc.uniq.each {|address| email_array << address unless address.match(/\@whyspam.me$/i).nil? }  unless email.cc.nil?
    email.bcc.uniq.each {|address| email_array << address unless address.match(/\@whyspam.me$/i).nil? } unless email.bcc.nil?
    return email_array
  end
 
 
  def self.find_or_create_and_send(email)
    message = email.body
    email_addresses = Ticket.get_email_addresses(email)
    
    email_addresses.each do |to_email|
      whymail = Whymail.find(:first, :conditions => ['(email = ?)', to_email.upcase ] ) 
      @ticket = Ticket.create(:subject => email.subject, :from_email => email.from.first, :to_email => to_email, :whymail_id => whymail.id,
                                  :body => message , :email => email.to_s, :body_hash => Digest::SHA1.hexdigest(message) ) unless whymail.nil?

      @ticket.send_email(to_email, email) unless @ticket.nil?
    end
    
    return @ticket
    
  end
    
    
  
  def send_email(whymail_address, email)
    if self.valid?
      MyMailer.deliver_forward(self.whymail.user.email, whymail_address, email)        
    end
  end
  


  
 # def after_create    
 #   if self.valid?
 #      whymail = Whymail.find(:first, :include => :user, :conditions => ['(email = ?)', self.to_email.upcase ] )    
 #     if !whymail.nil?
 #         self.update_attributes({"whymail_id" => whymail.id})
 #         MyMailer.deliver_forward(whymail.user.email, self.from_email, self.to_email, self.subject, self.body) if self.valid?
 #     end
 #   end
 # end
    
end
