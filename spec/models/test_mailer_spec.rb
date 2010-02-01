require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TestMailer do 
  

  
 # describe "TestMailer test forward " do
 #   before(:each) do
 #     @to_email = "autoTest@foo.com"
 #     @forward_email = "forward@foo.com"
 #   end
 #
 #   # forward email if it has many attachments 
 #   
 #   it "should send mime email" do
 #     TestMailer.deliver_mime(@to_email)
 #     mail = TMail::Mail.parse(getMockEmails.last)
 #     sleep 1
 #     TestMailer.deliver_forward(@forward_email, mail)
 #     forwardmail = TMail::Mail.parse(getMockEmails.last)
 #     forwardmail.to.first.should == @forward_email
 #     forwardmail.subject.should == mail.subject
 #     forwardmail.date.should_not == mail.date # makes sure it is a different email
 #     forwardmail.parts.count.should == mail.parts.count 
 #     $has_attachment.should == false
 #   end
 #   
 #   it "should send an email with an attachment email" do
 #     TestMailer.deliver_sendAttachment(@to_email)
 #     mail = TMail::Mail.parse(getMockEmails.last)
 #     sleep 1
 #     TestMailer.deliver_forward(@forward_email, mail)
 #     forwardmail = TMail::Mail.parse(getMockEmails.last)
 #     forwardmail.to.first.should == @forward_email
 #     forwardmail.subject.should == mail.subject
 #     forwardmail.date.should_not == mail.date # makes sure it is a different email
 #     $has_attachment.should == true
 #
 #   end
 #  
 #end
  
  describe "TestMailer Send Emails that test for common scenarios" do
    before(:each) do
      @to_email = "autoTest@foo.com"
    end
    
    it "should send mime email" do
      TestMailer.deliver_mime(@to_email)
      mail = getMockEmails.last
      TMail::Mail.parse(mail).should be_multipart
    end
    
    it "should send an email with an attachment email" do
      TestMailer.deliver_sendAttachment(@to_email)
      mail = getMockEmails.last
      result = TMail::Mail.parse(mail).has_attachments?
      result.should be_true
    end
    
    it "should send an email with multiple attachments" do
      TestMailer.deliver_sendMultipleAttachments(@to_email)
      mail = getMockEmails.last
      result = TMail::Mail.parse(mail).has_attachments?
      result.should be_true
    end
    
  #  it "should send an email with mime" do
  #    TestMailer.deliver_mime(@to_email)
  #    mail = getMockEmails.last
  #    TestMailer.deliver_forward("foo@email.com", TMail::Mail.parse(mail))
  #    
  #  end
    
    it "should send an email with multiple attachments" do
      TestMailer.deliver_sendMultipleAttachments(@to_email)
      mail = getMockEmails.last
      TestMailer.receive(mail)
    #  TestMailer.deliver_forward("foo@email.com", TMail::Mail.parse(mail))
      
    end
    
  end
  
end