Feature: Login Page for Binghamton Food Sharing App:
    As a student or event manager, 
    I want to login to the Binghamton Food Sharing App
    So that I can see the posted free food listing

Background: On Login page of Food Sharing App
    Given I am on the Login page of the Food Sharing App
    And I follow "CleanUp"
    Then I am on the Login page of the Food Sharing App
    Given the following user exists: 
    | name        | email                 | 
    | Tester Suny | tester@binghamton.edu |  

    Given the following authorization exists:
    | provider        | uid                 | user_id |
    | github          | 12345678            |  1      |
      

    
@omniauth_test
Scenario: Successful login for the existing user
    When I follow signup with "github"
    Then I should see the message, "Welcome back Tester Suny! You have logged in via github."
    And I am on the homepage for user "Tester Suny"
