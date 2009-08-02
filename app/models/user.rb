require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  
  
  has_many :forms, :class_name => 'Forms'                                                                             

  has_many :surveys
  
  has_many :info
  
  named_scope :find_by_email, lambda { |*args| {:conditions => ["email = ?", args.first.downcase]} }


 # needs email
 # needs login
 # needs password
  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..100
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  
  def self.receive_form_test
 #   mail = gen_mail("", email,"","")
#    MyMailer.receive(mail)
    
  end
  
  def self.test_receive_form
    
  end

                                                                                                  
                                                                                                  
    def self.find_by_secret_address(cryptmail)                                                    
      info = Info.find(:first, :include => :user, :conditions => ["cryptmail = ?", cryptmail ])   
      user = info.user                                                                            
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
  
 # def self.authenticate(login, password)
 #   return nil if login.blank? || password.blank?
 #   u = find_by_login(login.downcase) # need to get the salt
 #   u && u.authenticated?(password) ? u : nil
 # end
  
  def self.authenticate(email, password)
    return nil if email.blank? || password.blank?
    u = find :first, :conditions => ['(email = ? OR login = ?)', email, email] # need to get the salt
    if u == nil
      cryptmail = email.scan(/^[\w]+/)[0].to_s.downcase
      info = Info.find(:first, :include => :user, :conditions => ['(cryptmail = ?)', cryptmail ] )
      u = info.user if info
      return nil if ! info
    end
    
    u && u.authenticated?(password) ? u : nil
  end
  

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected
    


end
