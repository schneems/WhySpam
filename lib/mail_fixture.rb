module MailFixture 
  FIXTURES_PATH = File.dirname(__FILE__) + '/fixtures' 
  CHARSET = "utf-8" 
  def read_fixture(fixture) 
    IO.read("#{MailFixture::FIXTURES_PATH}/emails/#{fixture}") 
  end
  
  def gen_mail(from_email, to_email, subject, body) 
    temp_string  = IO.read("#{MailFixture::FIXTURES_PATH}/emails/template_email") 
    from_email =  "example@example.com"  if from_email.nil? || from_email == ""
    to_email = "foo@example.com" if to_email.nil? || to_email == ""
    subject = "testing testing" if subject.nil? || subject == ""
    body = "This is a test body. Pretty generic really, should make it past most filters" if body.nil? || body == ""
    temp_string = temp_string.gsub(/xxxfrom_emailxxx/, from_email ) 
    temp_string = temp_string.gsub(/xxxto_emailxxx/, to_email ) 
    temp_string = temp_string.gsub(/xxxsubjectxxx/, subject ) 
    temp_string = temp_string.gsub(/xxxbodyxxx/, body )
  end 
end 
