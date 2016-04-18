Feature: display the main page of the website when I log out of my account
  As a user or manager of Rizq
  So that I can log out of the website
  I want to be able to log out of my account
  
Background: The user has already created an account and is logged in
  Given that I am on my user homepage
  
Scenario: log out as a user or manager
  
  When I press "Logout"
  Then I should see the Rizq homepage