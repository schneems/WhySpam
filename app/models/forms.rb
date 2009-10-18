class Forms < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  attr_accessible :email, :comments
  before_validation  :clear_default_website
  
  named_scope :find_by_crypt, lambda { |*args| {:conditions => ["address = ?", args.first.upcase]} }  
  
  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  #validates_uniqueness_of   :email ## more than one form per email, seems reasonable

  def clear_default_website
    if self.comments == configatron.default_form_comment
      self.comments = ""
    end
  end
  
  
  def self.create_with_cryptform(email,comments)
    alph = ['Q','Z','X','V','N','H','W','M','S','R']
    form = Forms.create(:email => email, :comments => comments)
    if form != nil && form.valid?
      form_id = form.id.to_s
      jumble = ""
      0.upto(form_id.length) { |n| jumble += alph[form_id[n,1].to_i] }
      form.update_attribute(:address, jumble) if form.valid?
    end
      form
  end
  
  
end
