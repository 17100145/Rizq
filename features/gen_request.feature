Feature: Donation Request

  Scenario: Generate a request
    Given I'm logged in as a "donor"
    When I am on the homepage
    And I generate a request
    Then I should see the "Rizq was successfully created." post

  Scenario: Delete request as manager
    Given a receiver generates a request
    And I'm logged in as a "manager"
    When I am on my profile
    Then I should see the request on my profile
    And I should be able to delete the request

  Scenario: Assign Volunteer to request as manager
    Given there exists a volunteer "Vol"
    And a receiver generates a request
    And I'm logged in as a "manager"
    When I am on my profile
    Then I should be able to assign "Vol" to the request
