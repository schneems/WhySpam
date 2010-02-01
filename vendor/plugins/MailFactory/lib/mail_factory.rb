module MailFactory 
  TEMPLATES_PATH = File.dirname(__FILE__) + '/templates' 
  CHARSET = "utf-8" 

  def mail_factory(mail_hash = { }) 
    temp_string  = IO.read("#{MailFactory::TEMPLATES_PATH}/emails/template_email") 
    mail_hash[:from_email] ||=  "example@example.com" 
    mail_hash[:to_email] ||= "foo@example.com"
    mail_hash[:subject] ||= "testing testing" 
    mail_hash[:body] ||= "This is a test body. Pretty generic really, should make it past most filters" 
    temp_string = temp_string.gsub(/xxxfrom_emailxxx/, mail_hash[:from_email]) 
    temp_string = temp_string.gsub(/xxxto_emailxxx/, mail_hash[:to_email] ) 
    temp_string = temp_string.gsub(/xxxsubjectxxx/, mail_hash[:subject] ) 
    temp_string = temp_string.gsub(/xxxbodyxxx/, mail_hash[:body] )
  end
  
  
 def readEmail(email_to_read) 
   temp_string  = IO.read("#{MailFactory::TEMPLATES_PATH}/emails/#{email_to_read}") 
   return temp_string
 end 
end 
