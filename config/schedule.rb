every 1.minutes do
  ## command "/usr/bin/ruby /home/demo/public_html/whyspam.me/current/script/runner /home/demo/public_html/whyspam.me/current/lib/getmail.rb -e production"
  # rake "mailbox:check"
end

every 5.minutes do
  ## command "/usr/bin/ruby /home/demo/public_html/whyspam.me/current/script/runner /home/demo/public_html/whyspam.me/current/lib/getmail.rb -e production"
  rake "mailbox:isworking"
end




