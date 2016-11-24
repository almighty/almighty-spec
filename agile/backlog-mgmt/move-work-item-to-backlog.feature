Feature: Move work items from iterations into backlog

Scenario: Move work item into backlog

Given an existing project
  And a work item is in a sprint
  And I am the product owner
 When I move the work item back into the backlog
 Then the sprint should be updated to exclude the work item in it's scope
  And the effort spent in the sprint should include the effort spent on the work item in that sprint
  And the rank of the backlog in the sprint should be set to the position in the backlog where the work item was added.