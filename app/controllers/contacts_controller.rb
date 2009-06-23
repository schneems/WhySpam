class ContactsController < ApplicationController

 #  TODO: David: Create an email that explains how the system works...
 #  TODO: David: Create an original Slogan "Why Spam Me (No Thanks Sir Spamalot)"
 #  TODO: David: Create a HOW-TO to place on the front page, simple enough for to 80% of intelegent people
 
 
 #  TODO: BOTH: Create a HOW-TO with pictures to hand hold with pictures and inputs that walks through
 #  TODO: BOTH: play with layout, find room for one advertisement
 #  TODO: BOTH: Terms of Service, Privacy Policy, Contact
 #  TODO: BOTH: Figure out a way to incorporate one picture, people trust other peoples faces. 
 
 
 
 # TODO: Richard: Opt out email link...make it work 
 # TODO: Richard: Create Mailer Form That auto sends mail pre-populated explaining the system
 # TODO: Richard: Contact Form for Us
 # TODO: Richard: js forms for other websites
 # TODO: Richard: js site badges
 # TODO: Richard: Slopsbox like functionality
 # TODO: Richard: Reminder email one week
 
 
 
  def remove_email
    whole_cryptmail = params[:cryptmail]
    cryptmail = whole_cryptmail.scan(/^[\w]+/)[0].to_s.downcase ## ass7s3j4028234723482918181 ...
    address = whole_cryptmail.scan(/[\w.]+$/)[0].to_s.downcase ## @whyspam.me  end
 
  end 
  
  def decryptEmail(cryptmail)
    email = Info.find(:first, :conditions => {:cryptmail => cryptmail})
    email
  end
  
  
 
 #Info.create(:cryptmail => "d3395867d05cc4c27f01")
 #   create_digest("blah", "blah")
 
     

        
   
     
  
  def send_welcome_email
    # triggered via:
    # http://localhost:3000/contacts/send_welcome_email

    # note the deliver_ prefix, this is IMPORTANT
    
    #gmail
    
    MyMailer.deliver_welcome("Dave", "")

    # optional, but I like to keep people informed
    flash[:notice] = "You've successfuly registered. Please check your email for a confirmation!"

    # render the default action
    render :action => 'index'  
  end
  
  
  
  ## parse an email, get sent to, lookup in database
  def list
    contacts = Contact.all(:order => params[:order])
    respond_to do |wants|
      wants.js {
        records = contacts.map do |contact|
          { :guid      => contact.id,
            :type      => contact.class.name,
            :firstName => contact.first_name,
            :lastName  => contact.last_name
          }
        end
        render :text => { :records => records, :ids => contacts.map(&:id) }.to_json
      }
    end
  end
  
  
  
  
end