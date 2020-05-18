Feature: Home Page for Binghamton Food Sharing App:
As a student,
he/she can be aware of food available at any event
I(Event Manager) can give away the leftover food to the student

#Background: On home page of Food Sharing App
#When I am on Home page of Food Sharing App

Scenario:Home page has content

When I am on the Food Sharing App Home page 
Then I should see "Welcome to Shardo"
Then I should see "signup"
Then I should see "login"

Scenario:Successful student Signup
  
When I press signup
Then I am on the Food Sharing App Signup page
And I fill in "Name"
And I fill in "Username"
And I fill in "email"
And I fill in "phonenumber "
And I fill in "password"
And I fill in "confirmpassword"
And I choose 'student' #"radio_student"
And I press "signup"
Then I am on the Food Sharing App Home page
And I should see "Registered successfully"

