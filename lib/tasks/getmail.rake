namespace :mailbox do 

  
  
  desc "checks all mail in the mailbox"
    task :check => :environment do
        begin
          Lockfile.new('cron_mail_fetcher.lock', :retries => 0) do
            config = YAML.load_file("#{RAILS_ROOT}/config/mailer_daemon.yml")
            config = config[RAILS_ENV].to_options

            fetcher = Fetcher.create({:receiver => MyMailer}.merge(config))
            fetcher.fetch
            puts "Fetcher Created"
            
          end
        rescue Lockfile::MaxTriesLockError => e
          puts "Another fetcher is already running. Exiting."
        end
    end
  
    
    
    desc "checks to see if everything is working"
      task :isworking => :environment do
        testmail = "thisisatestmailboxforwhyspammeyeahthtatsawesome@whyspam.me"
        subject = "This is a subject line someone would send"
        from_email = "canary@whyspam.me"
        tickets = Ticket.find(:all, :conditions => {:from_email => from_email, :to_email => testmail, :subject => subject})
        tickets.each do |ticket|
          ticket.destroy
        end
        MyMailer.deliver_sample(testmail)
        sleep 300
        begin
          ticket = Ticket.find(:first, :conditions => {:from_email => from_email, :to_email => testmail, :subject => subject})
          ticket.delete
        rescue
          puts "there was an error"
          MyMailer.deliver_warning(configatron.admin_email)
          MyMailer.deliver_warning(configatron.admin_sms)
        end
      end
    
    
    
    desc "cleans up all slop over 24 hours old"
      task :cleanup => :environment do

      end
    
  
end