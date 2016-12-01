Feature: Assign to iteration

Scenario: Move work item into a sprint/iteration

Given an existing project
  And a work item is in the backlog
  And I am the product owner
 When I move the work item into a sprint
 Then the sprint should be updated to include the work item in it's scope
  And the rank of the work item in the sprint should be set to the position in the sprint where the work item was added.
