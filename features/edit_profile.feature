Feature: Home Page for Binghamton Food Sharing App:
As a student,
he/she can be aware of food available at any event
I(Event Manager) can give away the leftover food to the student

Background: On home page of Food Sharing App
  Given I am on the Login page of the Food Sharing App
  And I follow "CleanUp"
  Then I am on the Login page of the Food Sharing App
 #Following users exist
     #Given the following user exists:
     #| name        | email                 | 
     #| Tester Suny | tester@binghamton.edu |
     
    # Given the following authorization exists:
   # | provider        | uid                 | user_id |
    #| github          | 12345678            |  1      |
    
     #Given the following post exists:
     #|title  | image       | ingredients | location   | quantity | post_age | user_id|
     #| pizza | picture.png | olives      | Binghamton | 3        | 4hrs     | 2      |

#When I am on Home page of Food Sharing App
@omniauth_test
Scenario:Edit Profile page has content
When I follow signup with "github"
Then I should see the message, "Welcome Tester Suny! You have signed up via github."
#And I am on the homepage for user "Tester Suny"
And I am on the edit user page for user "Tester Suny"
Then I should see "User Profile" on page
Then I should see "Complete your profile" on page
And I fill in "First Name" with "Tester"
And I fill in "Last Name" with "Suny"
And I select "student" from "User Type"
And I press "Update User Info"
Then I should see "Tester was successfully updated."
And I am on the homepage for user "Tester Suny"
