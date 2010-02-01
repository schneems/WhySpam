require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ticket do 
  
  describe "Ticket.get_email_addresses" do
    it "should make an array of email addresses" do 
      mail = TMail::Mail.new
      mail.bcc = ["hey@whyspam.me", "what@whyspam.me"]
      mail.cc = ["sups@whyspam.me", "hey@whyspam.me"]
      mail.to = ["olivia@whyspam.me", "richard@whyspam.me"]
      array = Ticket.get_email_addresses(mail)
      array.count.should == 6
    end
    
    it "should only return an array of email addresses if they end in @whyspam.me" do 
      mail = TMail::Mail.new
      mail.bcc = ["hey@foo.me", "what@whyspam.me"]
      mail.cc = ["sups@foo.me", "hey@whyspam.me"]
      mail.to = ["olivia@foo.me", "richard@whyspam.me"]
      array = Ticket.get_email_addresses(mail)
      array.count.should == 3
    end
    
  end
  # create new ticket, only if one does not already exist.
  
  describe "Ticket.find_or_create_and_send(email)" do
    it "should create a new ticket and email" do 
      @whymail = Factory.create(:whymail)
      TestMailer.deliver_mime(@whymail.email)
      email = TMail::Mail.parse(getMockEmails.last)
      assert_difference [ "Ticket.count", "getMockEmails.count" ] , 1 do
        Ticket.find_or_create_and_send(email)
      end      
    end
    
    it "should not create a new ticket or email if there is no whymail" do 
      TestMailer.deliver_mime("foo@foo.com")
      email = TMail::Mail.parse(getMockEmails.last)
      assert_difference [ "Ticket.count", "getMockEmails.count" ], 0 do
        Ticket.find_or_create_and_send(email)
      end      
    end
    
    it "should not create duplicate emails" do 
      @whymail = Factory.create(:whymail)
      TestMailer.deliver_mime(@whymail.email)
      email = TMail::Mail.parse(getMockEmails.last)
      assert_difference [ "Ticket.count", "getMockEmails.count" ] , 1 do
        Ticket.find_or_create_and_send(email)
      end
      assert_difference [ "Ticket.count", "getMockEmails.count" ] , 0 do
        Ticket.find_or_create_and_send(email)
      end      
    end
    
    
    

    
  end
  
  
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

      user = Factory(:user)
      @whymail = Factory(:whymail, :user_id => user.id)
      TestMailer.deliver_mime(@whymail.email)
      mail = getMockEmails.last
      
      assert_difference "Ticket.count", 1 do
        MyMailer.receive(mail)
      end
      assert_difference "Ticket.count", 0 do
        MyMailer.receive(mail)
      end
      
    end
      
  end
  
end