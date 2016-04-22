Feature: Posts on Home page
    
  Scenario: Empty post by manager
    Given I'm logged in as a "manager"
    When I am on my profile
    And I click "post"
    Then I should see the "Empty Status" post
    
  Scenario: Creating post by manager
    Given I'm logged in as a "manager"
    When I am on my profile
    And I enter post "Some post"
    And I click "post"
    Then I should see the "Some post" post
  
  Scenario: Viewing post by manager
    Given there's a manager named "Ben" and he posts "helloyello"
    When I am on the homepage
    Then I should see the "helloyello" post
    
  Scenario: Post by user
    Given there's a user named "Dave", who is not a manager, and he posts "Hola"
    When I am on the homepage
    Then I should not see the "Hola" post