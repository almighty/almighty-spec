Feature: Workitem collaboration

Scenario: Subscribe to notifications against work item

Given an existing project
  And an existing work item in any state
  And I am a team member
 When I add myself as a subscriber to the work item
 Then the list of subscribers for that work item should be updated to include me.

Scenario: Add comments to a work item

Given an existing project
  And an existing work item in any state
  And I am a team member
 When I comment on the work item
 Then the comment must be recorded against the work item
  And notifications should be sent to all subscribers to the work item
  And the notification should include who made the comment and what was the comment.

Scenario: Receive notifications on work item updates

Given an existing project
  And an existing work item in any state
  And I am a team member
 When I update any field in the work item that should possibly succeed
 Then the update must be captured
  And notifications should be sent to all subscribers to the work item
  And the notification should include who made the update and what was the update.