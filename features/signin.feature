Feature: Check Signup

  Scenario: Check Insecure Password
    Given I am on the signup page
    And I choose password "abc"
    And I fill in my other details
    And I click "Create my account"
    Then I should see a warning "Password is too short (minimum is 5 characters)"
