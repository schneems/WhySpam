Given /^I am (.+) logged in$/ do |bool|
  if bool == "not"
     post logout_path
     assert_equal 'You have been logged out.', flash[:notice] 
  else
    user = Factory.create(:user)
    post :login, :name => user.email, :password => user.email
  end
end

Then /^(.+) flashes before my eyes$/ do |f|
  # assert f == @browser.get_text("id=flash")  
  assert f =~ Regexp.new(@browser.get_text("id=flash"))
end


Then /^I should be redirected to login$/ do  
  @browser.wait_for_page_to_load
  assert /^http\:\/\/localhost\:3000\/login$/ =~ @browser.get_location
 # assert /^Please Login First$/ =~ @browser.get_text("id=flash")  
  
#         root_password = @browser.get_text("id=flash").sub(/You will receive an email upon completion. The new root password will be: /, '')  
#  @browser.is_element_present("Please Login First").should be_true
  
  #assert_equal 'Please Login First', flash[:notice] 
 # assert_template :controller => "sessions", :action => "new"
 # assert_response :success
 # 
end

Then /^I successfully login$/ do  
  
  @browser.wait_for_page_to_load
  @user = Factory.create(:user)  
  
  @browser.type('email', @user.email)
  @browser.type('password', @user.email)
  @browser.click 'login_button'
  @browser.wait_for_page_to_load
  assert @browser.is_text_present("Logged in successfully")
#  assert /^Logged in successfully$/ =~ @browser.get_text("id=flash")  
#  assert /^http\:\/\/localhost\:3000\/manage$/ =~ @browser.get_location
end


Given /^I have a disposable email that has received an email$/ do
  
  assert_difference 'Whymail.count', +1 do   
    post '/no_spam', :user => {:email => "#{@user.email}", :website => "example.com"}
  end
  
  userwhymail = @user.whymail.last
  to_email = userwhymail.email
  mail = mail_factory(:to_email => to_email)
  
  assert_difference 'userwhymail.tickets.count', 1 do   
    MyMailer.receive(mail)
    sleep(1)
  end


end

Then /^I click the first table row$/ do   
  @browser.click "css=tr.clickable"
end

And /^I wait for jquery to load$/ do
  @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
end

And /^I wait for the page to load$/ do
  @browser.wait_for_page_to_load
end

And /^I see a confirmation$/ do
  assert @browser.is_confirmation_present
  ## note by default selenium always clicks OK on confirmation pages
end

Then /^I get (.+) count$/ do |model|
  @count = model.capitalize.constantize.count
end

Then /^I assert (.+) difference (.+)$/ do |model, difference|
  @browser.wait_for_page_to_load
  assert_same model.capitalize.constantize.count, (@count + difference.to_i)
end

Then /^I have a disposable form that has received an email$/ do
  user = User.last
  Factory.create(:forms, :email => user.email, :address => "abcd", :user_id => user.id)
  address = Forms.last.address
  @browser.open "http://localhost:3000/forms/#{address}"
  @browser.wait_for_page_to_load
  model = "form"
  @browser.type("#{model}_email", "cookie_monster@example.com")
  @browser.type("#{model}_comments", "hey hey hey uh uh hey hey hey")
  
  assert_difference 'Ticket.count', 1 do   
    
    @browser.click "#{model}_submit"
    @browser.wait_for_condition('selenium.browserbot.getCurrentWindow().jQuery.active == 0', 10000)
  end
end


Then /^I change my password to "([^\"]*)"$/ do |new_password|
  email = User.last.email
  @browser.type("old_password", email)
  @browser.type("password", new_password)
  @browser.type("password_confirmation", new_password)  
  @browser.click "change_password_submit"
  
end



Then /^I change my login name to "([^\"]*)"$/ do |name|
  @browser.type("user_login", name)  
  @browser.type("user_password", "somethingnew")  
  @browser.click "user_submit"
  
  


end

