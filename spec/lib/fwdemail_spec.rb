require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')
  include Fwdemail

describe "Fwdemail" do 
  
  describe "appendfooter" do
    it "apppend a footer" do
      
    end
  end
  
  describe "change_friendly_from" do
    it "use a regula friendly from " do
      mail = TMail::Mail.new 
      mail.from = "Hello there <foo@example.com>"
      email = Fwdemail.change_friendly_from(mail, "what@what.com", :append_message => " (Forwarded by WhySpam.Me)")
      email.from.first.should == "what@what.com"
      email.friendly_from.should == "Hello there (Forwarded by WhySpam.Me)"
    end
    
    it "use a regula friendly from " do
      mail = TMail::Mail.new 
      mail.from = '"This Message Sent From Foo" <foo@example.com>'
      email = Fwdemail.change_friendly_from(mail, "what@what.com", :append_message => " (Forwarded by WhySpam.Me)")
      email.from.first.should == "what@what.com"
      email.friendly_from.should == "This Message Sent From Foo (Forwarded by WhySpam.Me)"
    end
    
    it "their email address if the regular friendly from does not exist" do
      mail = TMail::Mail.new 
      mail.from = '<foo@example.com>'
      email = Fwdemail.change_friendly_from(mail, "what@what.com", :append_message => " (Forwarded by WhySpam.Me)")
      email.from.first.should == "what@what.com"
      email.friendly_from.should == "foo@example.com (Forwarded by WhySpam.Me)"
    end
    
  #  it "should false" do
  #    false.should == true
  #  end
    
  end
  

  
end