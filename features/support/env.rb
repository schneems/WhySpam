# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] ||= "cucumber"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'

# Comment out the next line if you don't want Cucumber Unicode support
require 'cucumber/formatter/unicode'

#======
require 'spec/expectations'
require 'selenium'

#require 'factory_girl'
require 'test/factories.rb'

# "before all"
  browser = Selenium::SeleniumDriver.new("localhost", 4444, "*chrome", "http://localhost", 15000)

Before do    
  ## clear the DB, without transactional fixtures, destroy first so i can use for to seed DB with 
  ## data for development even when cucumber is not running
  User.destroy_all
  Info.destroy_all
  Ticket.destroy_all
  Survey.destroy_all
  Website.destroy_all
  Forms.destroy_all
  
    @browser = browser
    @browser.start
end
 
After do
  @browser.stop

end
 
# "after all"
at_exit do
  browser.close rescue nil
end
#====
include MailFixture

# Comment out the next line if you don't want transactions to
# open/roll back around each scenario
# Cucumber::Rails.use_transactional_fixtures
## transactional fixtures don't work properly with factory-girl/selenium/cucumber

# Comment out the next line if you want Rails' own error handling
# (e.g. rescue_action_in_public / rescue_responses / rescue_from)
Cucumber::Rails.bypass_rescue

require 'webrat'

Webrat.configure do |config|
  config.mode = :rails
end

require 'cucumber/rails/rspec'
require 'webrat/core/matchers'
