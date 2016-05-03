Feature: Edit

  Scenario: Edit user details
    Given I'm logged in as a "manager"
    When I am on my profile
    And I follow "Settings"
    Then I can edit my details