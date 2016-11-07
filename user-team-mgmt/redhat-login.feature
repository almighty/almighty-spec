Feature:
In order to access and use the application requiring an identified user,
As an unidentified user, I should be able to login to the application using my developers.redhat.com credentials before performing operations in the application.

  Background: A user with GitHub account exists
  
    Given the following users exist:
      | User  | developers.redhat.com user account	| persona      | 
      | Cyril | redhat_cyril        				| Senior Dev   | 
      | John  | redhat_john         				| Junior Dev   | 
      | Devin | redhat_devin        				| Devops Engg  | 
      | Sam   | redhat_sam          				| Scrum Master | 
      | Pablo | redhat_pablo        				| Product Mgr  | 
      | Ula   | redhat_ula          				| UX Designer  | 
  
      And I am on the Almighty homepage or CLI base context
  
  Scenario: Login as previously unregistered user (#304)
  
    Given an unregistered user,
     When I choose to sign in to the application using my developers.redhat.com credentials
     Then I should see a post-login message
      And I should be registered as a user in Almighty
  
  Scenario: Login as already registered user using developers.redhat.com credentials (#304)
  
    Given a previously registered user in Almighty,
     When I login to the application using my developers.redhat.com credentials,
     Then I should see a post-login message
  
  Scenario: Display login status (#304)
  
    Given a previously registered user in Almighty,
      And I am signed in
     When I access the dashboard or root context,
     Then I should see a 'Logged in as' message displaying the currently logged in user.
  
  Scenario: Link existing Almighty account with developers.redhat.com account (#304)
  
    Given a previously registered user in Almighty
      And the user was registered with his GitHub account
     When I login to the application using my developers.redhat.com credentials,
     Then I should see a post-login message
      And the two accounts should be linked in the system
