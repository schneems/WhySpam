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
    
    File.open("public/mailtest.txt", 'a+') {|f| f.write("\n ||========after_create===========||") }
    
    File.open("public/mailtest.txt", 'a+') {|f| f.write("\n"+ self.id.to_s) }
    File.open("public/mailtest.txt", 'a+') {|f| f.write("\n"+ self.valid?.to_s) }
    
    
    if self.valid?
      File.open("public/mailtest.txt", 'a+') {|f| f.write("\n"+ "===1") }
       whymail = Whymail.find(:first, :include => :user, :conditions => ['(email = ?)', self.to_email.upcase ] )    
      if !whymail.nil?
        File.open("public/mailtest.txt", 'a+') {|f| f.write("\n"+ "===2") }
        
       # self.whymail_id = whymail.id
       # self.save
       
       self.update_attributes({"whymail_id" => whymail.id})
       
        if self.valid?
          File.open("public/mailtest.txt", 'a+') {|f| f.write("\n"+ "===3") }
          
          
          MyMailer.deliver_forward(whymail.user.email, self.from_email, self.to_email, self.subject, self.body)        
        end
      end
    end
  end
    
end
