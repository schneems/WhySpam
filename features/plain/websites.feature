@websites

Feature: Websites
	In order to show website listings
	As a visitor
	I want see who spams and who doesnt

	Scenario: I visit websites and check one out
		Given I have a websites that is populated with surveys
		When I go to websites
		And I press "link=www.example1.com"
		And I wait for the page to load		
		Then I should see "Grade: F"


		
		
		#When I go to manage users
		#Then I should be redirected to login
		#And Please Login First flashes before my eyes