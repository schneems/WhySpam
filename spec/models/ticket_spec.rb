require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ticket do 
  
  describe "should utilize the body_hash" do
     it "should generate the same body hash for the same body" do
       message = "anything at all"
       body_hash = Digest::SHA1.hexdigest(message)
       body_hash.should == Digest::SHA1.hexdigest(message)
     end
     
     it "should generate a  different body hash for the same body" do
       message = "anything at all"
       body_hash = Digest::SHA1.hexdigest(message)
       different_message = "anything at all "
       body_hash.should_not == Digest::SHA1.hexdigest(different_message)
     end
     
   end
   
  describe "should pass validations" do
    it "should fail validiations if a ticket has the same to, from, and body" do
      subject = "hello"
      from_email = "blah@example.com"
      to_email = "boblawblah@example.com"
      message = "this validation should work and only one ticket be created"
      
      
      assert_difference "Ticket.count", 1 do
        @this_ticket = Ticket.create(:subject => subject, :from_email => from_email, :to_email => to_email, :body => message)
      end
      @this_ticket.valid?.should == true
      
      assert_difference "Ticket.count", 0 do
        @this_ticket = Ticket.create(:subject => subject, :from_email => from_email, :to_email => to_email, :body => message)
      end
      @this_ticket.valid?.should_not == true
      
     # @this_ticket.should_not be_valid?
      
    end
    
    
    
    
    it "should only generate one ticket per incoming email" do
      @whymail = Factory.create(:whymail)
      mail = mail_factory(:to_email => @whymail.email  )
      
      assert_difference "Ticket.count", 1 do
        MyMailer.receive(mail)
      end
      assert_difference "Ticket.count", 0 do
        MyMailer.receive(mail)
      end
      
    end
      
  end
  
end