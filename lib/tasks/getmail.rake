namespace :mailbox do 
  
  desc "checks all mail in the mailbox"
    task :check => :environment do
        begin
          Lockfile.new('cron_mail_fetcher.lock', :retries => 0) do
            config = YAML.load_file("#{RAILS_ROOT}/config/mailer_daemon.yml")
            config = config[RAILS_ENV].to_options

            fetcher = Fetcher.create({:receiver => MyMailer}.merge(config))
            fetcher.fetch
          end
        rescue Lockfile::MaxTriesLockError => e
          puts "Another fetcher is already running. Exiting."
        end
    end
  
    
    
    desc "checks to see if everything is working"
      task :isworking => :environment do
        testmail = "thisisatestmailboxforwhyspammeyeahthtatsawesome@whyspam.me"
        tickets = Ticket.find(:all, :conditions => {:from_email => "ArubyOnRailsProcess@mycomputer.com", :to_email => testmail, :subject => "This is a subject line someone would send"})
        tickets.each do |ticket|
          ticket.destroy
        end
        MyMailer.deliver_sample(testmail)
        sleep 180
        begin
          ticket = Ticket.find(:first, :conditions => {:from_email => "ArubyOnRailsProcess@mycomputer.com", :to_email => testmail, :subject => "This is a subject line someone would send"})
          ticket.delete
        rescue
          MyMailer.deliver_warning(configatron.admin_email)
        end
      end
    
    
    
    desc "cleans up all slop over 24 hours old"
      task :cleanup => :environment do

      end
    
  
end