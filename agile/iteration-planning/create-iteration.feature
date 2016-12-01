Feature: Create iterations
In order to have a team take on work items in a product backlog,
As a product or feature owner
I want to create iterations so that items from the backlog can be assigned to a timebox with a defined goal.

  Background: 
    Given a project Pizza the Hut
      And the project type is Scrum
      And the product backlog contains workitems
  
  Scenario: Create iteration
  
    Given I am logged in as Pablo,
     When I create a new iteration with start date as "14-Nov-2016", a duration of "4 weeks" and an optional goal 
     Then a new iteration should be created

  Scenario: Create multiple iterations
    Given I am logged in as Pablo,
     When I create a new iteration "Sprint 1" with start date as "14-Nov-2016", a duration of "4 weeks" and an optional goal
	  And I create a new iteration "Sprint 1" with start date as "12-Dec-2016", a duration of "4 weeks" and an optional goal
     Then a new iteration "Sprint 1" should be created
	  And a new iteration "Sprint 2" should be created
  
  Scenario: Create iteration that overlaps with period of another iteration 
  
    Given I am logged in as Pablo,
      And an existing iteration is created
     When I create a new iteration with start date as "14-Nov-2016", a duration of "4 weeks" and an optional goal 
      And the new iteration overlaps with the existing one
     Then a new iteration should be created
  
  Scenario: Create iteration with start date after end date
  
    Given I am logged in as Pablo,
     When I create a new iteration with start date as "14-Nov-2016", an end date "10-Nov-2016" and an optional goal 
     Then a new iteration should not be created
      And a alert with message "Start date should be before end date" should be displayed
	  
  Scenario: Create iteration of custom duration
  
    Given I am logged in as Pablo,
     When I create a new iteration with start date as "14-Nov-2016", an end date of "19-Dec-2016" and an optional goal 
     Then a new iteration should be created
	 
  Scenario: Assign work items to created iteration
    Given I am logged in as Pablo,
      And an existing iteration "Sprint 1" is present
	  And an existing work item "Architectural Runway - Auth" is present in the backlog
     When I assign the work item "Architectural Runway - Auth" to iteration "Sprint 1"
	 Then the work item "Architectural Runway - Auth" should be assigned to iteration "Sprint 1"
