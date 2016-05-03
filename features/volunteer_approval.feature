Feature: Volunteer Approval

  Scenario: Volunteers
    Given there is a volunteer request
    And I'm logged in as a "manager"
    When I am on my profile
    Then I should see volunteer details under "Approve Volunteers"
    And I should see a "approve" button
    And I should see a "reject" button

  Scenario: Approve Volunteers
    Given there is a volunteer request
    And I'm logged in as a "manager"
    And I follow "approve"
    When I am on my profile
    Then the volunteer should be approved

  Scenario: Reject Volunteers
    Given there is a volunteer request
    And I'm logged in as a "manager"
    And I follow "reject"
    When I am on my profile
    Then the volunteer account should be deleted
