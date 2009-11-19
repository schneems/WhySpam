

Feature: Generate Email
  In order to generate email
  As a user
  I want to generate a disposable email address

@email
    Scenario: Generating an email address
    	When I go to home
    	And I submit my unique user email address
		Then I should see "@WHYSPAM.ME"
		And I make sure the disposable email shows up
		Then I receive a email message
		
		When I submit a duplicate user email address
		Then I should see "You already have an email on file for this website/email combo, btw"
		And I make sure the disposable email shows up
		Then I submit an incorrect user email address
		And I should see "There were errors with your Email Address. Please try Again"
