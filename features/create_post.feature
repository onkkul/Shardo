Feature: Home Page for Binghamton Food Sharing App:
As a student,
he/she can be aware of food available at any event
I(Event Manager) can give away the leftover food to the student

Background: Following users exist
     Given the following user exists:
     | name        | email                 | 
     | Tester Suny | tester@binghamton.edu |
     
     Given the following authorization exists:
    | provider        | uid                 | user_id |
    | github          | 12345678            |  1      |
    
     Given the following post exists:
     |title  | image       | ingredients | location   | quantity | post_age | user_id|
     | pizza | picture.png | olives      | Binghamton | 3        | 4hrs     | 2      |

@omniauth_test
Scenario: See Create Post page
    Given I follow signup with "github"
    Then I should see "Create" on page
    And I follow "Create Post"
    Then I should see "Create a post" on page
    And I should see "Post Title" on page
    And I should see "Ingredients" on page
    And I should see "Location" on page
    And I should see "image" on page
    And I should see "Quantity" on page
    And I should see "Post Age" on page
    When I fill in "Ingredients" with "Tomato"
    And I press "Create new Post!"
    And I should see "successfully created" on page


