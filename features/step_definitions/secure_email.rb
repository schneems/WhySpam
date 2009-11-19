

Then /^I submit my unique user email address$/ do
  model = "user"
  
  user = User.find(:first, :conditions => {:email => "unique_email@example.com"})
  user.delete if user != nil
  @browser.type("#{model}_email", "unique_email@example.com")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
  
  user = User.find(:first, :include => [:whymail => :tickets], :conditions => {:email => "unique_email@example.com"})
  @email = user.whymail.last.email
  
end

Then /^I submit a duplicate user email address$/ do
  model = "user"
  
  @browser.type("#{model}_email", "non_unique_email@example.com")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
  @browser.type("#{model}_email", "non_unique_email@example.com")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
  user = User.find(:first, :include => [:whymail => :tickets], :conditions => {:email => "non_unique_email@example.com"})
  @email = user.whymail.last.email
  
end

Then /^I submit an incorrect (.*) email address$/ do |model|
  @browser.type("#{model}_email", "asdf")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
end

Then /^I make sure the disposable email shows up$/ do  
  assert_equal true , @browser.is_text_present(@email.upcase)
  
  #user = User.last(:include => [:whymail => :tickets])
  #assert_is_equal u.email, "unique_email@example.com"
  #@email = user.whymail.email
  #@browser
  
  
end

Given /^I receive a email message$/ do 
  to_email = @email
  mail = gen_mail("", to_email,"","")
  TMail::Mail.parse(mail).to.to_s
  whymail = Whymail.find(:first, :include => [:user, :tickets], :conditions => {:email => @email})
  whymail.tickets.count
  
  assert_difference 'whymail.tickets.count', 1 do   
    MyMailer.receive(mail)
  end
  
  
end





