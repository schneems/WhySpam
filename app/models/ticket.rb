class Ticket < ActiveRecord::Base
  
  belongs_to :whymail
  belongs_to :forms
  
  attr_accessible :to_email, :to_email, :from_email, :subject, :body
  
  #  apply_simple_captcha :message => " Image and text were different, please try again", :add_to_base => true
  
  validates_uniqueness_of   :to_email, :scope => [:body, :from_email]
  validates_presence_of     :to_email
  validates_presence_of     :from_email
  validates_presence_of     :subject
  validates_presence_of     :body
  
  
  
  
  def after_create
    if self.valid?
       i = Whymail.base_class
       whymail = Whymail.find(:first, :include => :user, :conditions => ['(email = ?)', self.to_email.upcase ] )    
      if !whymail.nil?
        self.whymail_id = whymail.id
        MyMailer.deliver_forward(whymail.user.email, self.from_email, self.to_email, self.subject, self.body)        
      end
    end
  end
    
    # @user.valid_with_captcha?
end
