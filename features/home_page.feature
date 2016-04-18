Feature: Posts on Home page

  Scenario: Viewing post by manager
    Given there's a manager named "Ben" and he posts "helloyello"
    When I am on the homepage
    Then I should see the "helloyello" post
    
  Scenario: Post by user
    Given there's a user named "Dave", who is not a manager, and he posts "Hola"
    When I am on the homepage
    Then I should not see the "Hola" post