require File.expand_path(File.dirname(__FILE__) + "/../test_helper.rb")



#require 'test_helper'

class WhymailTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  def test_sanitize_website
    whymail = Whymail.create(:email => "UNIQUECRYPTMAIL@WHYSPAM.ME", :website => "http://www.foo.com")
    assert whymail.valid?
  #  whymail.sanitize_website
    assert_equal whymail.website, "foo.com"
    whymail = Whymail.create(:email => "UNIQUECRYPTMAIL2@WHYSPAM.ME", :website => "www.foo.com")
    assert whymail.valid?
 #   whymail.sanitize_website
    assert_equal whymail.website, "foo.com"
    whymail = Whymail.create(:email => "UNIQUECRYPTMAIL3@WHYSPAM.ME", :website => "foo.com")
    assert whymail.valid?
  #  whymail.sanitize_website
    assert_equal whymail.website, "foo.com"
    whymail = Whymail.create(:email => "UNIQUECRYPTMAIL4@WHYSPAM.ME", :website => "foo.com/asdlkfjalskdjf")
    assert whymail.valid?
    whymail.sanitize_website
    assert_equal whymail.website, "foo.com"
    whymail = Whymail.create(:email => "UNIQUECRYPTMAIL5@WHYSPAM.ME", :website => "http://www.foo.com/asdlkfjalskdjf/aslkdfjlkj/alskdjflksjf")
    assert whymail.valid?
  #  whymail.sanitize_website
    assert_equal whymail.website, "foo.com"
    whymail = Whymail.create(:email => "UNIQUECRYPTMAIL56WHYSPAM.ME", :website => "http://www.foo.com/asdlkfja/lskdjf/a.slk:dfj;lkj/?al!skd#{}$jf$lks%jf^")
    assert whymail.valid?
  #  whymail.sanitize_website
    assert_equal whymail.website, "foo.com"
  end
  
  def test_validates_presence_of_email
    whymail = Whymail.new
    assert !whymail.valid?
    assert whymail.errors.on(:email)
    
  end
  
  def test_uniqueness_presence_of_email
    whymail = Whymail.create(:email => "1234")
    whymail = Whymail.create(:email => "1234")
    assert !whymail.valid?
    assert whymail.errors.on(:email)    
  end 

end
