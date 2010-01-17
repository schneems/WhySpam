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
    #   Whymail.email("A527827171573EB1FD1125337E1DF725D53DAB37")
    
  def user_must_be_valid

      errors.add("The email address you provided") if user.nil?
      
  end
    
  def website_cannot_be_email
    errors.add(:website, "cannot be an email address") if is_email(website)
  #  puts "==============================="
  #  puts is_email(website)
  #  puts errors.full_messages
  end


    
    
    
    def self.create_with_user(email, website)

     user = User.find_or_create_by_email(email)

     whymail = user.whymail.find(:first, :conditions => ["website = ?", website])||user.whymail.create_with_digest(email, website)
      
     
     
    end
    
    
    def self.create_with_digest(email, website)
      digest = create_digest(email, website)
        self.create(:email => digest.upcase + "@WHYSPAM.ME", :website => website) 

    end
    

    def website_to_listings
      site = self.website
      Website.find(:first, :conditions => ["url = ?", site])||Website.create(:url => site, :grade => "N/A", :rank => 0)
    end
    

     def sanitize_url
      url = self.website||""
      url = url.gsub(/^website$/, 'No Website Given') ## removes "website" 
        if !url.empty?
            self.website = clean_url(url)
        end
     #  var regExUrl = new RegExp("http...[\\d\\D][^\/]+", "g");
    # 	var whyspam_url = current_url_to_string.match(regExUrl);
     end
     
     
     def self.create_digest(email, site)   
         email = Digest::SHA1.hexdigest(email+site)    
          guess = email[0,20]
         if Whymail.email(guess.upcase) == []
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
     
     
    
end
