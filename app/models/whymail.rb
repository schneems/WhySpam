class Whymail < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  validates_presence_of     :email
  validates_uniqueness_of   :email
  validates_presence_of     :user_id
  
  named_scope :email, lambda { |*args| {:conditions => ["email = ?", args.first.upcase]} }
  attr_accessible :email, :comments, :website, :email
  before_save :sanitize_url, :website_to_listings
  #after_destroy :createusedwhymail
  validate :website_cannot_be_email
  validate :user_must_be_valid
    
  include Cleanurl
    
  def user_must_be_valid
      errors.add("The email address you provided") if user.nil?      
  end
    
  def website_cannot_be_email
    errors.add(:website, "cannot be an email address") if is_email(website)
  end    
    
    
    
    def self.create_with_user(email, website, atAddress)
     user = User.find_or_create_by_email(email)
     whymail = user.whymail.find(:first, :conditions => ["website = ?", website])
     
     if (whymail.nil? ?  true : whymail.email[-atAddress.size, atAddress.size].downcase != atAddress )
      whymail =  user.whymail.create_with_digest(email, website, atAddress) 
     end
     whymail
      
    end
    
    
    def self.create_with_digest(email, website, atAddress)
      digest = create_digest(email, website, atAddress)
        self.create(:email => digest.upcase , :website => website) 
    end
    

    def website_to_listings
      site = self.website
      Website.find_or_create_by_url(self.website)
     # Website.find(:first, :conditions => ["url = ?", site])||Website.create(:url => site, :grade => "N/A", :rank => 0)
    end
    

     def sanitize_url
      url = self.website||""
      url = url.gsub(/^website$/, 'No Website Given') ## removes "website" 
        if !url.empty?
            self.website = Cleanurl.sanatize(url)
        end
     end
     

     
     def self.create_digest(email, site, atAddress)   
         email = Digest::SHA1.hexdigest(email+site+Time.now.to_s)    
          guess = email[0,20]
          atAddress = atAddress.upcase
         if Whymail.find_by_email(guess.upcase + atAddress).nil?
           # return guess
         else
           Whymail.create_digest(guess, site, atAddress)
         end ## first if
           return guess + atAddress
     end
     
     
    
end
