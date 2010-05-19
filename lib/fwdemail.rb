module Fwdemail
 def self.change_friendly_from(email, to_email, options = {} )  
    friendly_from = email.friendly_from || email.from.first
    template = '"#{friendly_from}"  <#{to_email}>'
    template = template.gsub(/\#\{friendly_from\}/, friendly_from.to_s + options[:append_message].to_s)
    template = template.gsub(/\#\{to_email\}/, to_email.to_s)
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
          
          
          
          ## by setting creating a new TMail object and setting its body, TMail will encode  the body for us.
          tempTMail = TMail::Mail.new
          
          tempTMail.body =  footer[:html] unless footer[:html].nil?      
          ## calling part.encoded will return encoded body wich contains an extra set of Content-Type:, Content-Transfer-Encoding:, and Content-Disposition:
          part.body = part.encoded.gsub(/Content-Type:(.)+$|Content-Transfer-Encoding:(.)+$|Content-Disposition:(.)+$/, "") +  tempTMail.encoded
        elsif part.content_type == "text/plain"          
            part.body = part.encoded + footer[:plain] unless footer[:plain].nil?
        end  
      end 
    end


#asdf


end