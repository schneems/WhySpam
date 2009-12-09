class Ticket < ActiveRecord::Base
  
  belongs_to :whymail
  belongs_to :forms
  
  attr_accessible :to_email, :to_email, :from_email, :subject, :body, :whymail_id
  
  
  validates_uniqueness_of   :to_email, :scope => [:body, :from_email]
  validates_presence_of     :to_email
  validates_presence_of     :from_email
  validates_presence_of     :subject
  validates_presence_of     :body
  

  
  def after_create
      puts "========after_create==========="
      puts self.id
      puts self.valid?
    if self.valid?
      puts "==1=="
       whymail = Whymail.find(:first, :include => :user, :conditions => ['(email = ?)', self.to_email.upcase ] )    
      if !whymail.nil?
        puts "==2=="
        
       # self.whymail_id = whymail.id
       # self.save
       
       self.update_attributes({"whymail_id" => whymail.id})
       
        if self.valid?
          puts "==3=="
          
          MyMailer.deliver_forward(whymail.user.email, self.from_email, self.to_email, self.subject, self.body)        
        end
      end
    end
  end
    
end
