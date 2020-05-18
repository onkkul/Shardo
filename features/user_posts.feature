Feature: Dashboard Page for Binghamton Food Sharing App:
As a student,
he/she can be aware of food available at any event
I(Event Manager) can give away the leftover food to the student

#Background: On home page of Food Sharing App
#When I am on Home page of Food Sharing App

# Scenario:Dashboard page has content

#When I am on the user_posts  page 
#Then I should see "Dashboard"
#Then I should see "CleanUp"
#Then I should see "EditProfile"
#Then I should see "Create Post"


Scenario: Successful Signup for the first time user

When I press signup using Github
Then I am on the edit_user page
#And I should see "EditProfile"

Scenario: Successful Signup for the existing user
When I press signup using Github
Then I am on the user_posts page
Then I should see "Dashboard"
Then I should see "CleanUp"
Then I should see "EditProfile"
#Then I should see "Create Post"

Scenario: Unsuccessful Signup for the existing user
When I press signup using Github
Then I am on the welcome_login page

Scenario: Unsuccessful Signup for the first time user
When I press signup using Github
Then I am on the welcome_login page

Scenario: Successful Signup for the eventmanager user
When I am on the user_posts 
Then I should see "Dashboard"
Then I should see "CleanUp"
Then I should see "EditProfile"
Then I should see "Create Post"