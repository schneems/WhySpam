every 1.minutes do
  ## command "/usr/bin/ruby /home/demo/public_html/whyspam.me/current/script/runner /home/demo/public_html/whyspam.me/current/lib/getmail.rb -e production"
   rake "mailbox:check"
end

every 30.minutes do
  ## command "/usr/bin/ruby /home/demo/public_html/whyspam.me/current/script/runner /home/demo/public_html/whyspam.me/current/lib/getmail.rb -e production"
  rake "mailbox:isworking"
end


every 6.hours do
  rake "cleanup:old_tickets"
end

