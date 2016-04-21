Feature: Check Login

  Scenario: Login by manager
    Given I'm a manager with email "manager@rizq.com" and password "abcd1234"
    When I am on the login page
    And I enter email "manager@rizq.com"
    And I enter password "abcd1234"
    And I click "Log in"
    Then I should see my username "manager@rizq.com" 
    And I should see a "Logout" button

  Scenario: Wrong Login
    Given I'm a manager with email "manager@rizq.com" and password "abcd1234"
    When I am on the login page
    And I enter email "manager@rizq.com"
    And I enter password "abcd123"
    And I click "Log in"
    Then I should see a "Log in" button
    Then I should not see a "Logout" button
