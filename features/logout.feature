Feature: Check Logout

  Scenario: Logout by manager
    Given I'm logged in as a "manager"
    And I follow "Logout"
    Then I should see a "Login" button