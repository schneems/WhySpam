require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ticket do 
  
  describe "" do
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