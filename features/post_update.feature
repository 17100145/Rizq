  Feature: display updated 
      As a manager of Rizq
      So that I can post messages to the main website page
      I want to be able to post updates about food donations and requests
      
  Background: The user already has an account as a Manager of the website
    
  Scenario: enter message and post to page
  
    When I enter in a message
    And I press "post"
    Then I should see my message posted on my user homepage and the message "updated" appear