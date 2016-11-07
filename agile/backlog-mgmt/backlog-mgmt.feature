  Feature: Project backlog management
  
  Scenario: Add work items to backlog
  
    Given an existing project,
      And a user with permissions to add items to backlog,
     When the user adds an item to the backlog with title and description,
     Then a new work item with a project-unique ID should be created in the backlog
      And the creator of the work item must be the said user.
  
  Scenario: Rank work items in sprint
  
    Given an existing project
      And the project has atleast one sprint under planning or current underway,
     When I change the rank of a work item in a sprint or backlog
     Then the rank of the work item should be updated and retained until a subsequent change is made.
  
  Scenario: Move work item into a sprint/iteration
  
    Given an existing project
      And a work item is in the backlog
      And I am the product owner
     When I move the work item into a sprint
     Then the sprint should be updated to include the work item in it's scope
      And the rank of the work item in the sprint should be set to the position in the sprint where the work item was added.
  
  Scenario: Move work item into backlog
  
    Given an existing project
      And a work item is in a sprint
      And I am the product owner
     When I move the work item back into the backlog
     Then the sprint should be updated to exclude the work item in it's scope
      And the effort spent in the sprint should include the effort spent on the work item in that sprint
      And the rank of the backlog in the sprint should be set to the position in the backlog where the work item was added.