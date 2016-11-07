Feature: Project and build pipeline integration
In order to build the source code of a project,
As a developer,
I want to add a build pipeline definition in the source code
And have it recognized and made available to execute build jobs

  Scenario: Detect a OpenShift build pipeline
  
    Given an existing project
      And a git repository linked to the project
     When I commit a OpenShift build config manifest to the git repository
     Then a new OpenShift build pipeline definition should be recognized and made available in the project.
  
  Scenario: Detect a Jenkins build pipeline
  
    Given an existing project
      And a git repository linked to the project
     When I commit a JenkinsFile to the git repository
     Then a new Jenkins build pipeline should be created in the Jenkins
  
  Scenario: Create a OpenShift build pipeline
  
    Given an existing project
      And a detected OpenShift build pipeline in the project
     When I activate the build pipeline
     Then an OpenShift build pipeline should be created and linked to the project.
  
  Scenario: Create a Jenkins build pipeline
  
    Given an existing project
      And a detected Jenkins build pipeline in the project
     When I activate the build pipeline
     Then a Jenkins build pipeline should be created and linked to the project.
  
  Scenario: Start a new build manually
  
    Given an existing project
      And an active build pipeline linked to the project
     When I start the build manually
     Then a new build job should be created and scheduled for execution
      And the build job should be based on the build pipeline definition.
  
  Scenario: Start a new build from branch participating in pull request
  
    Given an existing project
      And an active build pipeline linked to the project
      And a pull request is in the open state
     When I trigger the build with a comment on the pull request
     Then a new build job should be created and scheduled for execution
      And the build job should be based on the build pipeline definition.
  
  Scenario: Start a new build from commit to development branch
  
    Given an existing project
      And an active build pipeline linked to the project
      And a pull request is in the open state
     When I trigger the build with a comment on the pull request
     Then a new build job should be created and scheduled for execution
      And the build job should be based on the build pipeline definition.
  
  Scenario: Start a new build from a schedule
  
    Given an existing project
      And an active build pipeline linked to the project
      And the pipeline is associated with a job schedule
     When the scheduler is triggered to execute the pipeline
     Then a new build job should be created and scheduled for execution
      And the build job should be based on the build pipeline definition.
  
  Scenario: Display status of pipelines and builds
  
    Given an existing project
      And an active build pipeline linked to the project
     When I view the builds of the project
     Then I should be able to see the status of every build executed
      And the status should include when the job was started, finished and the status (result) of the job.
  
  Scenario: Cancel a running build
  
    Given an existing project
      And an active build pipeline linked to the project
      And a job is initialized to build the pipeline
     When I cancel the job
     Then the job should be finished
      And the job state should be set to Terminated or Cancelled.
  
  Scenario: View a successful build
  
    Given an existing project
      And the source code is buildable to completion
      And an active build pipeline linked to the project
      And a job is initialized to build the pipeline
     When I wait for the job to be finished
     Then the job should be in the finished state
      And the job state should be set to Success
      And a container image should be created as a result of the build
      And I should be able to view the details of the image
      And I should be able to view the build log corresponding to the build
  
  Scenario: View a failed build
  
    Given an existing project
      And the source code is not buildable to completion
      And an active build pipeline linked to the project
      And a job is initialized to build the pipeline
     When I wait for the job to be finished
     Then the job should be in the finished state
      And the job state should be set to Failed
      And a container image should not be created as a result of the build
      And I should be able to view the build log corresponding to the failed build
      And the build log should contain the reason for the build failure
  
  Scenario Outline: View an errored-out build
  
    Given an existing project
      And an active build pipeline linked to the project
      And the build pipeline definition is invalid due to <invalid_reason>
      And a job is initialized to build the pipeline
     When I wait for the job to be finished
     Then the job should be in the errored state
      And a container image should not be created as a result of the build
      And I should be able to view the build log corresponding to the errored build
      And the build log should contain the reason for the build to error out
  
    Examples: 
      | invalid_reason              	| 
      | git repo location is invalid	| 
      | pipeline syntax is invalid  	|
	  | unable to create a job			|
