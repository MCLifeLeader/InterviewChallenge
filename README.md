# Interview Challenge Project

This project is intended to be used during the interview and hiring process. You can provide this project to a prospective candidate and
ask them to implement various functional behavior depending upon the role they are applying for.

Developers can be asked to implement functional behavior within the Api or App projects whereas a QA or SDET can use the test project
to implement test automation.

## Dependencies

* Visual Studio 2022 or Visual Studio Code
* C# .NET 6 Runtime and SDK
  * Nuget Packages
* Docker Engine or Daemon installed and running
  * If on Windows use Linux support (WSL)
  * I use Docker Desktop and recommend it as it provides a GUI interface to running the containers and container management.
* The InterviewChallenge.Tests project needs both the InterviewChallenge.Api and InterviewChallenge.App projects to successfully run the examples.
* (Optional) PowerShell version >= 7.2.1

## Build and Run Projects

These instructions will be for running on a local developer machine after cloning the project.

1. Run the following to build the C#.Net project and create the Docker images.</br>
./build_docker.ps1

2. Run the following to create the Docker containers and run them from the Docker images.</br>
./start_docker.ps1

3. Run the following to execute the tests.</br>
./run_tests.ps1

4. Run the following to stop and remove the Docker containers. Note: The Docker images will be left and this will only stop and remove the active containers.</br>
./stop_docker.ps1

## Build Yaml Scripts

1. Docker Container Deployment</br>
\Pipeline\Azure_Docker_Deployment.yml (Not Implemented Yet.)

## Deployed Projects

https://si-interview-app.azurewebsites.net/
https://si-interview-api.azurewebsites.net/swagger/index.html
