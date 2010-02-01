require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MyMailer do 
  
  describe "MyMailer forward " do
    before(:each) do
      @to_email = "autoTest@foo.com"
      @forward_email = "forward@foo.com"
      @whymail = "abcefghijklmnop@whyspam.me"
    end

    # forward email if it has many attachments 
    
    it "should send mime email" do
      TestMailer.deliver_mime(@to_email)
      mail = TMail::Mail.parse(getMockEmails.last)
      sleep 1
      MyMailer.deliver_forward(@forward_email, @whymail, mail)
      forwardmail = TMail::Mail.parse(getMockEmails.last)
      forwardmail.to.first.should == @forward_email
      forwardmail.subject.should == mail.subject
      forwardmail.date.should_not == mail.date # makes sure it is a different email
      forwardmail.parts.count.should == mail.parts.count 
      forwardmail.should_not be_has_attachment
    end
    
    it "should send an email with an attachment email" do
      TestMailer.deliver_sendAttachment(@to_email)
      mail = TMail::Mail.parse(getMockEmails.last)
      sleep 1
      MyMailer.deliver_forward(@forward_email, @whymail, mail)
      forwardmail = TMail::Mail.parse(getMockEmails.last)
      forwardmail.to.first.should == @forward_email
      forwardmail.subject.should == mail.subject
      forwardmail.date.should_not == mail.date # makes sure it is a different email
      forwardmail.should be_has_attachment

    end

    
  end
    
        
  include MailFixture
  describe "forward" do 
    it "parse and send this problem email" do
      email  = TMail::Mail.parse(readEmail("testing2.eml"))
      MyMailer.deliver_forward("foo@foos.com", "alskdjfalskfjlkJ@whyspam.me", email)
      email = TMail::Mail.parse(readEmail("testing2.eml"))
      email.body.strip.should_not be_empty
      email.body.strip.should_not be_nil
    end
    
  end
  
  describe "test receive" do
    before(:each) do
      user = Factory(:user)
      @whymail = Factory(:whymail, :user_id => user.id)
      TestMailer.deliver_mime(@whymail.email)
      @mail = getMockEmails.last
    end
    
    it "increment ticket count" do
      body_hash = Digest::SHA1.hexdigest(TMail::Mail.parse(@mail).body.to_s) 
      assert_difference "Ticket.count", 1 do
        MyMailer.receive(@mail)
      end

      
      Ticket.last.body_hash.should == body_hash
    end
    
    it "increment ticket count only if unique" do
      assert_difference "Ticket.count", 1 do
        MyMailer.receive(@mail)
      end
      assert_difference "Ticket.count", 0 do
        MyMailer.receive(@mail)
      end
    end
    
    
   
    
    
  end
  
  describe "test forward_form" do
    before(:each) do
      @form = mock_model(Forms, :id => 1, :email => "testing@example.com", :address => "asdf")
    end
    
    it "should send emails to a valid form" do
      Forms.stubs(:find).returns(@form)
      Ticket.stubs(:find).returns(nil)
      assert_difference "Ticket.count", 1 do
        @mail =  MyMailer.create_forward_form(@form.id, "foo@example.com", "hey this is a test") 
      end
      
      @mail.reply_to.to_s.should == "foo@example.com"
      @mail.to.first.should == "testing@example.com"
    end
    
    it "should not send duplicate email if tickets already exist" do
      Forms.stubs(:find).returns(@form)
      Ticket.stubs(:find).returns(true)
      assert_difference "Ticket.count", 0 do
        @mail =  MyMailer.create_forward_form(@form.id, "foo@example.com", "hey this is a test") 
      end
    end
    
    
    # forward
    
  end
  
end