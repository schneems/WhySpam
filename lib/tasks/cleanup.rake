namespace :cleanup do 

  desc "clean out Tickets over 30 days old"
    task :old_tickets => :environment do 
      tickets = Ticket.find(:all, :conditions => ["created_at < ?", 30.days.ago ])
      puts "Deleteing #{tickets.count} old (30 days or more) tickets"
      tickets.each do |ticket|
        ticket.delete
      end
    end
    
    
  

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
          if survey.give_out != "true"
            survey.add_up_surveys
          end
        end        
      end      
    end
  
  
end