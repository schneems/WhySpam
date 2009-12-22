namespace :cleanup do 


  # rake cleanup:slopbox
  desc "cleans out slop box over 24 hours old"
    task :slopbox => :environment do
      tickets = Ticket.find(:all, :conditions => {:whymail_id => nil })
      tickets.each do |ticket|
        if ticket.created_at < Time.now - 24.hours
          ticket.delete
        end
      end
    end
    
    
# cleanup:survey_calculations  
  
  desc "re-calculates all surveys"
    task :survey_calculations => :environment do
      @websites = Website.find(:all, :include => :surveys)
      @websites.each do |website|
        website.opt_out_count = website.un_solicited_count = website.sell_count = website.vulgar_count = website.give_out_count = nil 
        puts website
        website.surveys.each do |survey|
          survey.add_up_surveys
        end        
      end
      
      
    end
  
  
end