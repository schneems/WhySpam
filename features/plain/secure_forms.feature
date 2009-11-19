Feature: Generate Forms
  In order to generate a form
  As a user
  I want to generate a disposable form
  
@form
    Scenario: Generating a form
    	When I go to forms
    	And I submit my unique form email address
		Then I should see "www.whyspam.me/forms/"
		And I should see "Give This Link to anyone you want to contact you"
		Then I visit my disposable form
		And I submit my test form email address
		
		# user_email
		@will
	Scenario: generating a duplicate form
		When I go to forms
		And I submit a duplicate form email address
		Then I should see "You already have an email on file for this comments/email combo"
		Then I submit an incorrect form email address
		And I should see "There were errors with your Email Address. Please try Again"
	##	Then I should see "Your message was forwarded to the creator of this form, thanks for using WhySpam.me !!"
