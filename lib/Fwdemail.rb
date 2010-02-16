module Fwdemail

 def self.change_friendly_from(email, to_email, options = {} )  
    friendly_from = email.friendly_from || email.from.first
    template = '"#{friendly_from}"  <#{from_address}>'
    template = template.gsub(/\#\{friendly_from\}/, friendly_from.to_s + options[:append_message].to_s)

    template = template.gsub(/\#\{from_address\}/, to_email.to_s)
  #  email.from = '"#{friendly_from}"  <#{to_email}>' unless friendly_from.nil?    
    email.from = template unless friendly_from.nil?    
    return email
  end 



  def self.appendfooter(part, footer = { })   
    ## takes an email and recursivly finds all parts of the email, if text/html or text/plain parts exist, then footer will get appended   
    if part.multipart?
        part.parts.each do |subpart|
          appendfooter(subpart, footer)
        end
    else
        if part.content_type == "text/html"
          part.body  = part.body + footer[:html].to_s
        elsif part.content_type == "text/plain"
          part.body  = part.body + footer[:plain].to_s
        end  
      end 
    end



end