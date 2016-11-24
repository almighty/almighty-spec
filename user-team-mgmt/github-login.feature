@story-304
Feature:
In order to access and use the application requiring an identified user,
As an unidentified user, I should be able to login to the application using my GitHub credentials before performing operations in the application.

  Background: A user with GitHub account exists
  
    Given the following users exist:
      | User  | GitHub user account | persona      | 
      | Cyril | redhat_cyril        | Senior Dev   | 
      | John  | redhat_john         | Junior Dev   | 
      | Devin | redhat_devin        | Devops Engg  | 
      | Sam   | redhat_sam          | Scrum Master | 
      | Pablo | redhat_pablo        | Product Mgr  | 
      | Ula   | redhat_ula          | UX Designer  | 
  
      And I am on the Almighty homepage or CLI base context
  
  Scenario: Login as previously unregistered user
  
    Given an unregistered user,
     When I choose to sign in to the application using my GitHub credentials,
     Then I should see a post-login message
      And I should be registered as a user in Almighty.
  
  Scenario: Login as already registered user using GitHub credentials
  
    Given a previously registered user in Almighty,
     When I login to the application using my GitHub credentials,
     Then I should see a post-login message
  
  Scenario: Display login status (#304)
  
    Given a previously registered user in Almighty,
      And I am signed in
     When I access the dashboard or root context,
     Then I should see a 'Logged in as' message displaying the currently logged in user.
  
  Scenario: Link developers.redhat.com account with GitHub login
  
    Given a previously registered user in Almighty
      And the user was registered with his developers.redhat.com account
     When I login to the application using my GitHub credentials,
     Then I should see a post-login message
      And the two accounts should be linked in the system
