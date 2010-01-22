set :user, 'demo'  # Your dreamhost account's username
set :domain, '174.143.236.205:30000'  # Dreamhost servername where your account is located 
#set :project, 'myapp_name_from_repository'  # Your application as its called in the repository
set :application, 'whyspam.me'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/public_html/#{application}/"  # The standard Dreamhost setup

#/home/demo/public_html/whyspam.me/current/public
# version control config

set :scm, 'git'
set :repository,  "git://github.com/thinkbohemian/WhySpam.git"
# file:///users/home/anoop/git/mephisto.git

set :deploy_via, :remote_cache
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true



# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false



namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/mailer_daemon.yml #{release_path}/config/mailer_daemon.yml"
    run "ln -nfs #{shared_path}/config/environments/development.rb #{release_path}/config/environments/development.rb"
    run "ln -nfs #{shared_path}/config/environments/production.rb #{release_path}/config/environments/production.rb"
    run "ln -nfs #{shared_path}/config/initializers/site_keys.rb  #{release_path}/config/initializers/site_keys.rb"
    run "ln -nfs #{shared_path}/config/config.yml  #{release_path}/config/config.yml"
    run "ln -nfs #{shared_path}/config/environment.rb  #{release_path}}/config/environment.rb"
    
 #   run "rake db:migrate RAILS_ENV=production"
 #    sudo "/etc/init.d/monit restart all"
  end
  
  desc "Update the crontab file"
  task :update_crontab, :roles => :db do
    run "cd #{release_path} && whenever --update-crontab #{application}"
  end
  
  desc "check to make sure server works"
  task :canary_check do
    
    
 #   run "rake mailbox:isworking"
    
  end
  
end




after 'deploy:update_code', 'deploy:symlink_shared', "deploy:symlink", "deploy:update_crontab", "deploy:canary_check"

