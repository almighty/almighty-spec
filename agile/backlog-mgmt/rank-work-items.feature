Feature: Rank work items in a project

Scenario: Rank work items in an unstarted sprint

Given an existing project
  And the project has a sprint "Sprint 102" under planning,
 When I change the rank of a work item in a sprint
 Then the rank of the work item should be updated and retained until a subsequent change is made.
 
Scenario: Rank work items in a sprint under execution

Given an existing project
  And the project has a sprint named "Sprint 101" currently underway,
 When I change the rank of a work item in "Sprint 101"
 Then the rank of the work item should be updated and retained until a subsequent change is made.
 
Scenario: Rank work items in backlog

Given an existing project
  And the project has work items in it's backlog,
 When I change the rank of a work item in the backlog
 Then the rank of the work item should be updated and retained until a subsequent change is made.
 
Scenario: Rank work items in a completed sprint

Given an existing project
  And the project has a completed sprint "Sprint 100",
 When I change the rank of a work item in "Sprint 100"
 Then the rank of the work item should be updated and retained until a subsequent change is made.