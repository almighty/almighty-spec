Feature: Assign team roles
	In order to "scale out work?"
	As an Admin
	I should be able to assign the following roles to team members, Admin, Product Manager, Product Owner, Scrum Master, Scrum Team Member, Guest

	Scenario Outline: Assign Team roles
		Given I am logged in with role <role>
		When I assign "another user" the <assign> role
		Then "another user" should have role <assign>

		Examples:
			| role   | assign |
			| Admin  | Admin  |
			| Admin  | Product Manager |
			| Admin  | Product Owner |
			| Admin  | Scrum Master |
			| Admin  | Scrum Team Member |
			| Admin  | Guest |

Feature: Operate on work items
	In order to do any work
	As a Product Manager or Owner
	I should be able to create and view hierarchy of Program/Product/Project/backlog/Release/sprint

	Scenario Outline: Create work items
		Given I am logged in with role <role>
		When I <action> an <type> work item
		Then I should be able to "view" <type>

		Examples:
			| role             | action | type |
			| Product Manager  | create | Program |
			| Product Manager  | create | Product |
			| Product Manager  | create | Project |
			| Product Manager  | create | Backlog |
			| Product Manager  | create | Release |
			| Product Manager  | create | Sprint |
			| Owner            | create | Program |
			| Owner            | create | Product |
			| Owner            | create | Project |
			| Owner            | create | Backlog |
			| Owner            | create | Release |
			| Owner            | create | Sprint |

Feature: Define project description
	In order to define our future goals
	As a Product or Owner
	I should be able to create a breif description for the program vision, product and project description

	Scenario: Describe the program vision

	Scenario: Describe the product description

	Scenario: Describe the project description

Feature: Timeboxed release cycles
	In order to something
	As a Product Manager or Owner
	I should be able to define the time box for the recurring sprint cycles ranging from 1 week to 4 weeks

Feature: Define scrum teams
	In order to ?
	As a Project Manager or Scrum Master
	I should be able to add my team members and assign them to a particular scrum team

Feature: Create team page
	In order to ?
	As a Scrum Master
	I should be able to create a scrum team overview page,
	which will have a brief description and links profile pages of team members

Feature: Sprint archiving
	In order to ?
	As a Project Manager or Scrum Master
	I should be able to archive past products/projects/releases and associated sprints
