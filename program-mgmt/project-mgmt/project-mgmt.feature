Feature: Project management
In order to group and manage related work items,
As a registered user, I should be able to create projects in the application,
And I should be able to switch across multiple projects in the application,
And I should be able to manage work items to a project,
And I should be able to link source code repositories to a project, 
And I should be able to create and manage build pipelines for a project,
And I should be able to create and manage various deployment environments for a project,
And I should be able to deploy build artifacts for a project to various environments.

  Scenario: Create Project
  
    Given a registered user,
     When I create a project with a unique <project_name> of a specific <project_type>
     Then a new project should be created.
	 
	 Examples:
	 |	project_name		|	project_type	|
	 |	Pizza The Hut		|	Scrum			|
	 |	Pizza The Hut		|	CMMI			|
  
  Scenario: Link Project with Source code repository
  
    Given an existing project,
     When I link a previously unlinked git repository to the project
     Then a linkage should be created between the project and the git repository.
  
  Feature: Users and roles management
  In order to collaborate with other users on a project,
  As a project admin, I should be able to manage users in my project.
  
  Scenario: Default admin
  
    Given a project created by me,
     When I view the list of users in the project,
     Then I should be able to invite additional users to the project.
  
  Scenario: Invite Users
  
    Given a project where I am the project administrator,
     When I invite a user through his email address,
     Then an invitation email should be sent to his email address
  
  Scenario: Complete invitation flow for unregistered user
  
    Given an unregistered user with an invitation email in my inbox,
     When I follow the link,
     Then I should be allowed to sign in with my GitHub credentials
      And I should be able to access the project to which I was invited.
  
  Scenario: Complete invitation flow for an already registered user
  
    Given a previously registered user with an invitation email in my inbox,
     When I follow the link,
     Then I should be allowed to sign in with my GitHub credentials
      And I should be able to access the project to which I was invited,
      And I should also be able to switch to and access other projects that I already had access to.
  
  Scenario: Resend Invitations
  
    Given an existing project 
      And I am the project administrator,
      And I have sent invites to other users, 
     When I view the list of invitations pending acceptance,
      And I resend an invitation to an invited user
     Then an invitation email should be resent to his email address
  
  Scenario: Deactivate Users in public project

    Given an existing project
	  And the project has a team with more than one user than myself,
      And I am the project administrator,
     When I view my project team
      And I deactivate a selected set of users,
     Then the project team should exclude the deactivated users,
	  And the deactivated users should not be able to perform operations on the project that require permissions afforded to team members
	  
  Scenario: Deactivate Users in private project

    Given an existing project
	  And the project has a team with more than one user than myself,
      And I am the project administrator,
     When I view my project team
      And I deactivate a selected set of users,
     Then the project team should exclude the deactivated users,
	  And the deactivated users should not be able to access the project