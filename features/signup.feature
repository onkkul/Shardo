Feature: Signup or Login Page for Binghamton Food Sharing App:
    As a student or event manager, 
    I want to sign up to the Binghamton Food Sharing App
    So that I can see the posted free food listing

Background: On Login page of Food Sharing App
    Given I am on the Login page of the Food Sharing App
    And I follow "CleanUp"
    Then I am on the Login page of the Food Sharing App

@omniauth_test
Scenario: Successful Signup for the first time user
    When I follow signup with "github"
    Then I should see the message, "Welcome Tester Suny! You have signed up via github."

@omniauth_test
Scenario: Unsuccessful Signup for the first time user
    When I follow signup with "github"
    Then I am on the welcome_login page
