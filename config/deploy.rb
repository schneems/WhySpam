set :user, 'snowmaninthesun'  # Your dreamhost account's username
set :domain, 'wolverine.dreamhost.com'  # Dreamhost servername where your account is located 
#set :project, 'myapp_name_from_repository'  # Your application as its called in the repository
set :application, 'whyspam.me'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}/"  # The standard Dreamhost setup

# version control config

set :scm, 'git'
set :repository,  "git://github.com/snowmaninthesun/WhySpam.git"
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





#set :user, "snowmaninthesun"
#set :application, "uniteddictionary.com"
#set :app_folder, "current"
#set :scm, 'git'
#set :repository, "git://github.com/snowmaninthesun/united-dictionary.git"
#set :deploy_via, :remote_cache
#set :git_enable_submodules, 1 # if you have vendored rails
#set :branch, 'master'
#set :git_shallow_clone, 1
#set :scm_verbose, true
#





#
#
#role :web, application
#role :app, application
#role :db,  application, :primary => true
#
#
#set :deploy_to, "/home/#{user}/#{application}/#{app_folder}"
#set :use_sudo, false
#set :checkout, "export"
#set :scm_verbose, true
#
#desc "Fix permissions and set environment after code update."
#task :after_update_code, :roles => [:app, :db, :web] do
#  # set permissions
#  run "chmod +x #{release_path}/script/process/reaper"
#  run "chmod +x #{release_path}/script/process/spawner"
#  # run "chmod 755 #{release_path}/script/spin"
#  run "chmod 755 #{release_path}/public/dispatch.*"
#  # switch to production mode in config/environment.rb
#  run "sed 's/# ENV\\[/ENV\\[/g' #{release_path}/config/environment.rb > #{release_path}/config/environment.temp"
#  run "mv #{release_path}/config/environment.temp #{release_path}/config/environment.rb"
#  # switch to fastcgi dispatcher in public/.htaccess
#  run "sed 's/RewriteRule \^\(\.\*\)\$ dispatch\.cgi/RewriteRule ^(.*)$ dispatch.fcgi/g' #{release_path}/public/.htaccess > #{release_path}/public/.htaccess-temp"
#  run "mv #{release_path}/public/.htaccess-temp #{release_path}/public/.htaccess"
#end
#
#desc "Start/restart server after deployment."
#task :restart_web_server, :roles => :web do
#  run "touch #{deploy_to}/current/public/dispatch.fcgi"
#end
#
#after "deploy:start", :restart_web_server
#after "deploy:restart", :restart_web_server


