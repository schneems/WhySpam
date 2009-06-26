class Ticket < ActiveRecord::Base
  
  belongs_to :info
  belongs_to :forms
    apply_simple_captcha :message => " Image and text were different, please try again", :add_to_base => true
  validates_uniqueness_of   :to_email, :scope => [:body, :from_email]
  validates_presence_of     :to_email
  validates_presence_of     :from_email
  
  
    
    # @user.valid_with_captcha?
end
