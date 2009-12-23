class Ticket < ActiveRecord::Base
  
  belongs_to :whymail
  belongs_to :forms
  
  attr_accessible :to_email, :from_email, :subject, :body, :whymail_id
  
  
  validates_uniqueness_of   :to_email, :scope => [:body, :from_email]
  validates_presence_of     :to_email
  validates_presence_of     :from_email
  validates_presence_of     :subject
  validates_presence_of     :body
  

  
  def after_create    
    # sleeps added due to possible race condition, evaluating permanent database fix
    if self.valid?
       whymail = Whymail.find(:first, :include => :user, :conditions => ['(email = ?)', self.to_email.upcase ] )    
       sleep 1  
      if !whymail.nil?
       self.update_attributes({"whymail_id" => whymail.id})
       sleep 1
        if self.valid?
          sleep 1
          MyMailer.deliver_forward(whymail.user.email, self.from_email, self.to_email, self.subject, self.body)        
        end
      end
    end
  end
    
end
