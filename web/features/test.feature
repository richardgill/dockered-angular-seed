Feature: Testing cucumber
  As a user of cucumber
  I want to ensure it is setup correctly
  So I can write features to my hearts content

  Scenario: visit home
    Given I am on the home page
    Then I should see "This is the partial for view 1." in ".view1"
