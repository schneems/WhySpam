class Whymail < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  validates_presence_of     :email
  validates_uniqueness_of   :email
  named_scope :email, lambda { |*args| {:conditions => ["email = ?", args.first.downcase]} }
  attr_accessible :email, :comments, :website, :email
    
  include Cleanurl
    #   Whymail.email("A527827171573EB1FD1125337E1DF725D53DAB37")
    
    def before_save
      self.sanitize_website
    end

     def sanitize_website
      url = self.website||""
      url = url.gsub(/^website$/, 'No Website Given') ## removes "website" 
        if !url.empty?
            self.website = clean_url(url)
        end
     #  var regExUrl = new RegExp("http...[\\d\\D][^\/]+", "g");
    # 	var whyspam_url = current_url_to_string.match(regExUrl);

     end
    
end
