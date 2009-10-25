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