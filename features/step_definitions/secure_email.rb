

Then /^I submit my unique user email address$/ do
  model = "user"
  
  user = User.find(:first, :conditions => {:email => "unique_email@example.com"})
  user.delete if user != nil
  @browser.type("#{model}_email", "unique_email@example.com")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
  
  user = User.find(:first, :include => [:info => :tickets], :conditions => {:email => "unique_email@example.com"})
  @cryptmail = user.info.last.cryptmail
  
end

Then /^I submit a duplicate user email address$/ do
  model = "user"
  
  @browser.type("#{model}_email", "non_unique_email@example.com")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
  @browser.type("#{model}_email", "non_unique_email@example.com")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
  user = User.find(:first, :include => [:info => :tickets], :conditions => {:email => "non_unique_email@example.com"})
  @cryptmail = user.info.last.cryptmail
  
end

Then /^I submit an incorrect (.*) email address$/ do |model|
  @browser.type("#{model}_email", "asdf")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
end

Then /^I make sure the secure email shows up$/ do  
  assert_equal true , @browser.is_text_present(@cryptmail.upcase)
  
  #user = User.last(:include => [:info => :tickets])
  #assert_is_equal u.email, "unique_email@example.com"
  #puts user
  #puts user.info
  #@cryptmail = user.info.cryptmail
  #@browser
  
  
end

Given /^I receive a cryptmail message$/ do 
  to_email = @cryptmail
  mail = gen_mail("", to_email,"","")
  TMail::Mail.parse(mail).to.to_s
  info = Info.find(:first, :include => [:user, :tickets], :conditions => {:cryptmail => @cryptmail})
  info.tickets.count
  
  assert_difference 'info.tickets.count', 1 do   
    MyMailer.receive(mail)
  end
  
  
end





