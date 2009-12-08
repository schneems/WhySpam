namespace :cleanup do 
  
  
# mailbox:check
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