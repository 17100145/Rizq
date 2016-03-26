Feature: display welcome user page when I log in by entering my username and password
  As a manager of Rizq
  So that I can keep track of donations and receiver requests
  I want to be able to log into my account
  
Background: The user has already created an account on the site
  Given the following users exist:
  | factoryboy@something.com  |
  | factorygirl@something.com |

  And I am on the Rizq home page
  
Scenario: log in a user
  
  When I enter my email "factoryboy@something.com"
  And I enter my password "123abc"
  And I press "Log in"
  Then I should see my user homepage
  