@story-296
Feature: Add work items to backlog

Scenario: Add work items to backlog

Given an existing project,
  And a user with permissions to add items to backlog,
 When the user adds an item to the backlog with title "Test bug" and description "Test bug for Almighty" with status "new"
 Then a new work item with a project-unique ID should be created in the backlog
  And the creator of the work item must be the said user
  And the work item must have title "Test bug", description "Test bug for Almighty", status "new".

Scenario: Add work items to backlog in closed state

Given an existing project,
  And a user with permissions to add items to backlog,
 When the user adds an item to the backlog with title "Test bug" and description "Test bug for Almighty" with status "closed"
 Then a new work item must not be created.
  
Scenario: Add work items to without title or description

Given an existing project,
 When the user adds an item to the backlog without title and description,
 Then a new work item must not be created.

Scenario: Add work items to a project with only view access

Given a user with permissions to only view work items in one project
 When the user adds an item to the backlog of a project that does not exist,
 Then a new work item must not be created.
 
Scenario: Add work items to non-existent project

Given a user with permissions to add items to backlog in one project
 When the user adds an item to the backlog of a project that does not exist,
 Then a new work item must not be created.