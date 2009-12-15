require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MyMailer do 
  
  
  describe "test forward_form" do
    before(:each) do
    #  @whymail = mock_model(Whymail, :id => 1, :email => "testing@example.com", :email => "asdf@whyspam.me")
    end
    
    it "should send emails to a valid form" do
     # Whymail.stubs(:find).returns(@whymail)
      @mail =  MyMailer.create_forward("testing@example.com", "foo@example.com", "asdf@whyspam.me", "subject", "message")
      @mail.from.first.should == "foo_at_example.com@whyspam.me"
      @mail.to.first.should == "testing@example.com"
    end
  end
    
        
  include MailFixture
  
  describe "test receive" do
    before(:each) do
      @mail = mail_factory(:to_email => "blah.com", :from_email => "foo.com", :subject => "whatup", :body => "hey")
      @bad_mail = read_fixture('bad-email-2')
    end
    
    it "increment ticket count" do
      assert_difference "Ticket.count", 1 do
        MyMailer.receive(@mail)
      end
    end
    
    it "increment ticket count only if unique" do
      assert_difference "Ticket.count", 1 do
        MyMailer.receive(@bad_mail)
      end
      assert_difference "Ticket.count", 0 do
        MyMailer.receive(@bad_mail)
      end
     # File.open("/public/mailtest.txt", 'w')
     
    # File.open("mailtest-#{Time.now}.txt", 'a+') {|f| f.write(@mail) }
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
      @mail.from.first.should == "foo@example.com"
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