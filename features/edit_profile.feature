Feature: Home Page for Binghamton Food Sharing App:
As a student,
he/she can be aware of food available at any event
I(Event Manager) can give away the leftover food to the student

Background: On home page of Food Sharing App
 Following users exist
     Given the following user exists:
     | name        | email                 | 
     | Tester Suny | tester@binghamton.edu |
     
     Given the following authorization exists:
    | provider        | uid                 | user_id |
    | github          | 12345678            |  1      |
    
     Given the following post exists:
     |title  | image       | ingredients | location   | quantity | post_age | user_id|
     | pizza | picture.png | olives      | Binghamton | 3        | 4hrs     | 2      |

#When I am on Home page of Food Sharing App

Scenario:Edit Profile page has content

Given I am on the edituser page for user "Tester Suny"
Then I should see "User Profile" on page
Then I should see "Complete your profile" on page
Then I should see "First Name" on page
Then I should see "Last Name" on page
Then I should see "User Type" on page
Then I should see "Update User Info" on page