class Whymail < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  validates_presence_of     :email
  validates_uniqueness_of   :email
  validates_presence_of     :user_id
  
  named_scope :email, lambda { |*args| {:conditions => ["email = ?", args.first.upcase]} }
  attr_accessible :email, :comments, :website, :email
  before_save :sanitize_url, :website_to_listings
  validate :website_cannot_be_email
  validate :user_must_be_valid
    
  include Cleanurl
    
  def user_must_be_valid
      errors.add("The email address you provided") if user.nil?      
  end
    
  def website_cannot_be_email
    errors.add(:website, "cannot be an email address") if is_email(website)
  end    
    
    def self.create_with_user(email, website)
     user = User.find_or_create_by_email(email)
     whymail = user.whymail.find(:first, :conditions => ["website = ?", website])||user.whymail.create_with_digest(email, website)   
    end
    
    
    def self.create_with_digest(email, website)
      digest = create_digest(email, website, "whyspam.me")
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
     

     
     def self.create_digest(email, site, server)   
         email = Digest::SHA1.hexdigest(email+site)    
          guess = email[0,20]
          server = server.upcase
         if Whymail.find_by_email(guess.upcase + "@" + server).nil?
           # return guess
         else
           guess = email[20,20]

           if Whymail.find_by_email(guess.upcase + "@" + server).nil?
             # return guess
           else
             count = 0
             if Whymail.find_by_email(guess.upcase + "@" + server).nil?
               count = count+1
               guess = Digest::SHA1.hexdigest(guess+count.to_s)[0,20]
             end # while 
           end # second if
         end ## first if
            return guess + "@" + server
     end
     
     
    
end
