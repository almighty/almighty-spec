Feature: Start iterations
In order to have a team take on work items in a product backlog,
As a product or feature owner
I want to start iterations so that iterations can be initialized and team members can record work against work items in the iteration.

  Background: 
    Given a project Pizza the Hut
      And the project type is Scrum
      And the product backlog contains workitems
	  And the project has an iteration named "Sprint 1-v1.1" with start date as "14-Nov-2016" and end date as "9-Dec-2016"
	  And the project has an iteration named "Sprint 1-v2.0" with start date as "14-Nov-2016" and end date as "9-Dec-2016"
	  And the project has an iteration named "Sprint 2-v1.1" with start date as "12-Dec-2016" and end date as "6-Jan-2017"
  
  Scenario: Start iteration with no assigned items
    Given I am logged in as Pablo,
	  And no work items are assigned to the iteration "Sprint 1-v1.1"
     When I start the iteration "Sprint 1-v1.1"
     Then the iteration "Sprint 1-v1.1" should marked as started
  
  Scenario: Start iteration with assigned work items
    Given I am logged in as Pablo,
	  And a work item of type "bug" with title "Fix Login" is assigned to the iteration "Sprint 1-v1.1"
     When I start the iteration "Sprint 1-v1.1"
     Then the iteration "Sprint 1-v1.1" should marked as started
  
  Scenario: Start multiple parallel iterations
    Given I am logged in as Pablo,
     When I start the iteration "Sprint 1-v1.1"
	  And I start the iteration "Sprint 1-v2.0"
     Then the iteration "Sprint 1-v1.1" should be marked as started
      And the iteration "Sprint 1-v2.0" should be marked as started
  
  Scenario: Start iteration with future start date
    Given I am logged in as Pablo,
	  And the current date is before "12-Dec-2016"
     When I start the iteration "Sprint 1-v2.0"
     Then the iteration "Sprint 1-v2.0" should be marked as started