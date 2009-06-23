class Ticket < ActiveRecord::Base
  belongs_to :info
  belongs_to :forms
    apply_simple_captcha :message => " Image and text were different, please try again", :add_to_base => true
    
    # @user.valid_with_captcha?
end
