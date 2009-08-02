@manage

Feature: Manage
	In order keep outsiders out
	As a user
	I want log in to manage my account
	

	Scenario: Not logged in attempting to manage an account
		Given I am not logged in
		When I go to manage users
		Then I should be redirected to login
		And Please Login First flashes before my eyes		
		
	Scenario: I log into manage my account and delete an email by viewing it then pressing delete
		Given I go to manage users
		And I successfully login
		When I have a secure email that has received an email
		And I go to manage users
		Then I click the first table row
		And I wait for the page to load
		Then I click the first table row
		And I wait for jquery to load
		And I get ticket count
		And I follow "css=#show_ticket a"
		Then I see a confirmation
		And I assert ticket difference -1
		Then I should see "No matching records found"
		

	Scenario: I log into manage my account and delete an email account
		Given I go to manage users
		And I successfully login 
		When I have a secure email that has received an email
		And I go to manage users
		Then I press "css=button.ticket_delete_button"
		And I wait for jquery to load
		And I should see "This is the last step before you block all spam"
		Then I get info count
		Then I press "css=#survey_submit" 
		And I assert info difference -1
		
		#Delete
@manage_1
	Scenario: I log into manage my account and delete an email account and submit a survey
		Given I go to manage users
		And I successfully login
		When I have a secure email that has received an email
		And I go to manage users
		Then I press "css=button.ticket_delete_button"
		And I wait for jquery to load
		
		And I should see "This is the last step before you block all spam"
		Then I get survey count
		Then I press "css=#survey_opt_out_true" 
		Then I press "css=#survey_un_solicited_true" 
		Then I press "css=#survey_sell_true" 
		Then I press "css=#survey_vulgar_true" 
		Then I press "css=#survey_submit_2 " 
		
		And I assert survey difference 1
		
		
		@manage_2
			Scenario: I log into manage my account and delete an form for my account
				Given I go to manage users
				And I successfully login 
				When I have a secure form that has received an email
				And I go to manage users		
				Then I get forms count
				Then I press "css=input.delete_button" 
				And I see a confirmation
				And I assert forms difference -1
				Then I should see "Form to http://localhost:3000/forms/abcd has been deleted"


			@manage_3
				Scenario: I log into manage my account and delete an form for my account
					Given I go to manage users
					And I successfully login
					
					When I have a secure form that has received an email
					And I go to manage users		
					Then I get ticket count
					
					
					Then I press "css=#dataTable_forms tbody tr.clickable" 
					And I wait for the page to load
					Then I press "css=tr.clickable"
					And I wait for jquery to load
					Then I press "link=Delete"
					
					And I see a confirmation
					And I assert ticket difference -1
					
					Then I should see "Form to http://localhost:3000/forms/abcd has been deleted"					
		   # 	Then I press "css=button.ticket_delete_button"
		   # 	And I wait for jquery to load
		   # 	And I should see "This is the last step before you block all spam"
		   # 	Then I get survey count
           #
           #
		   # 	And I assert survey difference 1
           #
		

			@manage_4
				Scenario: I log into manage my account and change my username and password
					Given I go to manage users
					And I successfully login
					Then I press "link=Account Settings"
					And I wait for the page to load
					Then I press "link=Change Password"
					And I wait for the page to load
					
					And I change my password to "somethingnew"
					And I wait for the page to load
					Then I should see "Password successfully updated"					
					Then I press "link=Edit"
					And I wait for the page to load
					Then I change my login name to "somethingelse"
					And I wait for the page to load		
					Then I should see "somethingelse"					
					
					And debugger

					#old_password

					#password

					#password_confirmation
