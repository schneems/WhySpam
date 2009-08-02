require 'test_helper'

class MailFixtureTest < ActionMailer::TestCase
 
  include MailFixture

  def test_default_mail_fixture
    mail = gen_mail("","","","")
    assert_equal "foo@example.com", TMail::Mail.parse(mail).to.to_s
    assert_equal "example@example.com", TMail::Mail.parse(mail).from.to_s
    assert_equal "testing testing", TMail::Mail.parse(mail).subject.to_s
    assert_equal "This is a test body. Pretty generic really, should make it past most filters\n", TMail::Mail.parse(mail).body.to_s
  end
  
  def test_substitution_values
    to_email = "blah@exmaple.com"
    from_email = "wazzah@example.com"
    subject = "dis is a subject"
    body = "Ahhhnnnald has nahhhthiiing on dis body"
    mail = gen_mail(from_email, to_email,subject,body)
    assert_equal to_email , TMail::Mail.parse(mail).to.to_s
    assert_equal from_email, TMail::Mail.parse(mail).from.to_s
    assert_equal subject, TMail::Mail.parse(mail).subject.to_s
    assert_equal body+"\n", TMail::Mail.parse(mail).body.to_s
  end
    
end