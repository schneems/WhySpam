

Then /^I submit my unique form email address$/ do
  model = "form"
  user = User.find(:first, :conditions => {:email => "unique_email@example.com"})
  user.delete if user != nil
  @browser.type("#{model}_email", "unique_email@example.com")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
end

Then /^I submit a duplicate form email address$/ do 
  model = "form"
  @browser.type("#{model}_email", "non_unique_email@example.com")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
  @browser.type("#{model}_email", "non_unique_email@example.com")
  @browser.click "#{model}_submit"
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
end

Then /^I visit my secure form$/ do
  crypt_form = Forms.last.crypt_form
  @browser.open "http://localhost:3000/forms/#{crypt_form}"
end


Then /^I submit my test form email address$/ do
  model = "form"
  @browser.type("#{model}_email", "cookie_monster@example.com")
  @browser.type("#{model}_comments", "hey hey hey uh uh hey hey hey")
  @browser.click "#{model}_submit"
  
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
end
