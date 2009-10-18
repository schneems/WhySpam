require 'test_helper'



class MyMailerTest < ActionMailer::TestCase
  # replace this with your real tests
  test "the truth" do
    assert true
  end
   include MailFixture
   
   def test_recieve_mail_pass_with_users
     whymail = Factory.create(:whymail)
     mail = mail_factory(:to_email => whymail.email)
     assert_difference 'Ticket.count', 1 do 
       MyMailer.receive(mail)
     end
     ticket = Ticket.last
     assert_equal TMail::Mail.parse(mail).subject, ticket.subject
     assert_equal whymail, ticket.whymail
   end
   
   
   
  
    def test_recieve_mail_pass
      my_mail = read_fixture('email_has_user_has_whymail') 
      Factory.create(:whymail, :email => TMail::Mail.parse(my_mail).to.to_s)
      assert_difference 'Ticket.count', 1 do 
        MyMailer.receive(my_mail)
      end 
            
      ticket = Ticket.last
      assert_equal TMail::Mail.parse(my_mail).subject, ticket.subject 
    end 
    
    
#    def test_recieve_mail_fail
#    my_mail = read_fixture('email_has_user_no_whymail') 
#           
#    Factory.build(:whymail, :email => "should_not_exist@example.com")
#      assert_no_difference 'Ticket.count' do 
#        MyMailer.receive(my_mail)
#      end 
#    end   


    def test_ignore_duplicate_mail
      my_mail = read_fixture('admin@whyspam.me') 
      MyMailer.receive(my_mail)
      assert_no_difference 'Ticket.count' do 
        MyMailer.receive(my_mail)
      end 
    end  
    
    
  
  def test_incoming_slop
    my_mail = read_fixture('slop@whyspam.me')
    assert_difference 'Ticket.count', 1 do 
      MyMailer.receive(my_mail)
    end
  end
    
  
end
