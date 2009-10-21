class User < ActiveRecord::Base
  
  
  acts_as_authentic do |c|
    # c.require_password_confirmation = false
    c.login_field = "email"
    # c.validate_password_field = false
    # c.ignore_blank_passwords = false
    # c.validates_length_of_password_field_options = {:minimum => 4}  
    c.validate_login_field = false  #don't validate email field with additional validations 
  end
  
  before_validation :add_login_if_nil , :add_password_if_nil
  
  
  has_many :forms, :class_name => 'Forms'                                                                             
  has_many :surveys
  has_many :whymail  
  
  
 # named_scope :find_by_email, lambda { |*args| {:conditions => ["email = ?", args.first.downcase]} }


  def self.create_digest(email, site)   
      email = Digest::SHA1.hexdigest(email+site)    
       guess = email[0,20]
      if Whymail.email(guess) == []
        # return guess
      else
        guess = email[20,20]

        if Whymail.email(guess) == []
          # return guess
        else
          count = 0
          while Whymail.email(guess) != []
            count = count+1
            guess = Digest::SHA1.hexdigest(guess+count.to_s)[0,20]
          end # while 
        end # second if
      end ## first if
         return guess
  end
  
  
  
       def self.find_by_secret_address(email)                                                    
         whymail = Whymail.find(:first, :include => :user, :conditions => ["email = ?", email ])   
         user = whymail.user                                                                            
         user                                                                                        
       end    

       def self.find_or_create_by_email(email)  
         user = User.find(:first, :conditions => ["email = ?", email])||User.create(:email => email, :login => email, :password => email, :password_confirmation => email)
         user.update_attribute(:login, "anon_" + user.id.to_s) if user.valid? && user.email == user.login
         user
       end


       def self.create_by_email(email)                                                                                   
         user = User.create(:email => email, :login => email, :password => email, :password_confirmation => email)
         user.update_attribute(:login, "anon_" + user.id.to_s) if user.valid?
         user
       end
                                                                                     
  
  def add_password_if_nil
    if self.password.nil? && !self.email.nil?
     self.password_confirmation = self.password = self.email  
    end
  end
  
  def add_login_if_nil
     while self.login.nil?  ## this will loop until we find a unique user login, race condition possible but not likely
         guess = "Anon_" + rand(999999999).to_s ## we have to guess the unique login because it may have been already selected
         if User.find_by_login(guess).nil? ## we have to check the guess to see if it already exists, if not we use it
             self.login = guess
            break
          end
     end # while
  end  
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

#  def self.find_by_login_or_email(login)
#    User.find_by_email(login)
#  end
  
  
end
