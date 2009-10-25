every 1.hours do
  # MyMailer.deliver_forward("testamifaction@whyspam.me", "thetestimafacator@whyspam.me", "blob", "subject", "testing testing")        
end


every 30.seconds do
  run "/home/demo/public_html/whyspam.me/current/script/runner /home/demo/public_html/whyspam.me/current/lib/getmail.rb  -e production"
end


after "deploy:symlink", "deploy:update_crontab"

