Feature: display new user page when I sign up after entering my details
  As a user of Rizq
  So that I can fill a form to donate food or receive food or manage website
  I want to be able to have an account as a user in the rizq database
  
Background: The user has already created an account on the site
  
  Given the following users exist:
  | factoryboy@something.com  |
  | factorygirl@something.com |

  And I am on the sign up page
  
  Scenario: sign up as a user
    When I fill in "Firstname" with "F"
    And I fill in "Lastname" with "L"
    And I fill in "Username" with "u"
    And I fill in "Email" with "fl@something.com"
    And I fill in "Password" with "pass123"
    And I fill in "Confirmation" with "pass123"
    And I fill in "Cnic" with "35201-1234567-3"
    And I fill in "Age" with "28"
    And I fill in "Address" with "Home Block A, DHA, Lahore"
    And I fill in "Organization" with "LUMS"
    And I fill in "Designation" with "None"
    And I fill in "Phone" with "0423-1234567"
    And I press "Create my account"
    Then I should see "u" in users #figure this out - how to append user to list of users


  