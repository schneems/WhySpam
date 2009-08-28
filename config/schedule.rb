every 1.hours do
  MyMailer.deliver_forward("testamifaction@whyspam.me", "thetestimafacator@whyspam.me", "blob", "subject", "testing testing")        
end


after "deploy:symlink", "deploy:update_crontab"

namespace :deploy do
  desc "Update the crontab file"
  task :update_crontab, :roles => :db do
    run "cd #{release_path} && whenever --update-crontab #{application}"
  end
end