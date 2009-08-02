Feature: View Slop
  In order to view the slopbox
  As a user
  I want to view the slopbox

@slop
    Scenario: viewing slop
    	When I go to slop_box		
		When I receive an email addressed to "slop@whyspam.me"
		Then I submit "slop@whyspam.me" to slopbox
	  	Then I should see "You've got mail"	
		Then I click the first table row
		And I wait for jquery to load
	
		Then I should see "Subject: testing testing" 
		When I press "css=[id='b_close']"
		Then I should not see "Subject: testing testing"	
		When I go to slop_box
    	And I submit "doesnt_exist_in_database@example.com" to slopbox 
		Then I should see "We haven't received any email at this email address, please try again later."
		
		