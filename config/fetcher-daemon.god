RAILS_ROOT = File.dirname(File.dirname(__FILE__))
FETCHER_SCRIPT = "#{RAILS_ROOT}/script/mailer_daemon_fetcher" 



God.watch do |w|
	w.name = "fetcher-daemon" 
	w.interval = 30.seconds # default      
	w.start   = "#{FETCHER_SCRIPT} start" 
	w.stop    = "#{FETCHER_SCRIPT} stop" 
	w.restart = "#{FETCHER_SCRIPT} restart" 
	w.start_grace = 10.seconds 
	w.restart_grace = 10.seconds 
	w.pid_file = File.join(RAILS_ROOT, 'log', 'MailerDaemonFetcher.pid') 
	w.behavior(:clean_pid_file)
	
	
	w.start_if do |start|
      start.condition(:process_running) do |c|
        c.interval = 5.seconds
        c.running = false
      end
    end


	w.restart_if do |restart|
      restart.condition(:memory_usage) do |c|
        c.above = 150.megabytes
        c.times = [3, 5] # 3 out of 5 intervals
      end
    
      restart.condition(:cpu_usage) do |c|
        c.above = 50.percent
        c.times = 5
      end
    end
end