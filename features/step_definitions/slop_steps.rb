
When /^I submit "([^\"]*)" to slopbox$/ do |email|
  debugger
  @browser.type("ticket_to_email", email)
  @browser.click "ticket_submit"
  
  @browser.wait_for_page_to_load
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
  
end

When /^debugger$/ do
  debugger
end


When /^I receive an email addressed to "([^\"]*)"$/ do |email|
    #include MailFixture
    
     my_mail = read_fixture(email)
     
     assert_difference 'Ticket.count', 1 do 
       MyMailer.receive(my_mail)
     end
     @tickets = Ticket.find(:all, :conditions => ["to_email = ?", email])
     assert_not_nil @tickets[0]
end



#When /^I press (.*)$/ do |css|
#  @browser.click css
#end
