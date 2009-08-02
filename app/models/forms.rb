class Forms < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  
 #validates_presence_of     :comments
  named_scope :find_by_crypt, lambda { |*args| {:conditions => ["crypt_form = ?", args.first.upcase]} }
  
  
  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
 # validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message
  
  
  
  def self.create_with_cryptform(email,comments)
    alph = ['Q','Z','X','V','N','H','W','M','S','R']
    form = Forms.create(:email => email, :comments => comments)
    if form != nil && form.valid?
      form_id = form.id.to_s
      jumble = ""
      0.upto(form_id.length) { |n| puts jumble += alph[form_id[n,1].to_i] }
      form.update_attribute(:crypt_form, jumble) if form.valid?
    end
      form
  end
  
  
end
