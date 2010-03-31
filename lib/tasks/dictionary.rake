namespace :dictionary do 

  
  desc "populates the dictionary"
    task :reset_shady => :environment do
        d = Dictionary.find(:all, :conditions => {:category => "shady"})
        d.each do |entry|
          entry.delete
        end
        File.open('lib/fixtures/shady.txt').each do |word|
          word = word.strip
          if !word.empty? && word.match(/[\W]/).nil?
            Dictionary.create(:word => word, :length => word.length, :category => "shady")

          end      
        end
        
    end
  end
  
  # rake cleanup:slopbox
  
  desc "populates the dictionary"
    task :populate_shady => :environment do
      File.open('lib/fixtures/shady.txt').each do |word|
        word = word.strip
        if !word.empty? && word.match(/[\W]/).nil?
          Dictionary.create(:word => word, :length => word.length, :category => "shady")
          
        end      
      end
    end
    
    desc "deletes the dictionary"
      task :delete_shady => :environment do
        d = Dictionary.find(:all, :conditions => {:category => "shady"})
        d.each do |entry|
          entry.delete
        end
      end
      
      
  desc "populates the dictionary"
    task :populate => :environment do
      File.open('lib/fixtures/english.txt').each do |word|
        word = word.strip
        if !word.empty? && word.match(/[\W]/).nil?
          Dictionary.create(:word => word, :length => word.length, :category => "generic")
          puts word
        end      
      end
    end
    
    desc "deletes the dictionary"
      task :delete => :environment do
        d = Dictionary.all
        
        d.each do |entry|
          entry.delete
        end
        
      end
    
    
end


