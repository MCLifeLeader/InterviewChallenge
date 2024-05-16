# Interview Challenge Project

Note: This project is under development and is not yet ready for use.

## Introduction

This project is designed to rigorously test the capabilities of each candidate across these crucial roles, ensuring that those 
who succeed are well-equipped to contribute significantly to our engineering efforts.

### Intented Audience

This project can be used for the following roles:
* Software Development Engineer (SDE)
* Software Development Engineer in Test (SDET)
* Quality Assurance Engineer (QAE)
* Database Engineer (DBE)

### Project Introduction and Overview

This Visual Studio project, utilizing C#, ASP.NET, and SQL Database, is designed as an advanced interview tool aimed at identifying and hiring highly skilled engineers. The project's complexity and comprehensive nature are intended to test candidates across a variety of roles: Software Development Engineer (SDE), Software Development Engineer in Test (SDET), Quality Assurance Engineer (QAE), and Database Engineer (DBE). Each role faces unique challenges that require not only a deep understanding of their respective fields but also the ability to apply practical knowledge to real-world problems. This interview challenge is structured to extend beyond conventional coding tests, necessitating multiple sessions and several hours to complete independently, thus providing a thorough assessment of each candidate's technical abilities, problem-solving skills, and perseverance.

### Software Development Engineer (SDE)

For the SDE role, candidates will encounter challenges in designing and implementing robust ASP.NET applications that interact efficiently with SQL databases. The key tasks will involve developing scalable web services, optimizing data retrieval, and ensuring seamless user interactions. Candidates will need to demonstrate their proficiency in writing clean, maintainable C# code, their understanding of web application architecture, and their ability to integrate complex business logic into a fully functional system. The complexity of the tasks will test the candidate's skills in handling concurrency issues, managing state, and preventing security vulnerabilities in a web application context.

### Software Development Engineer in Test (SDET)

Candidates interviewing for the SDET role will focus on developing automated test frameworks and tools to validate the software created by SDEs. The challenge includes writing comprehensive unit tests, integration tests, and system tests using C#. They will need to demonstrate a strong grasp of testing methodologies and the ability to implement tests that are both effective and efficient. The SDET will also face challenges in mocking database interactions and ensuring that edge cases are properly tested, which requires a deep understanding of both the code base and the SQL database operations. This role's complexity lies in creating a testing environment that mimics real-world scenarios to catch bugs and ensure the application's reliability and performance under stress.

### Quality Assurance Engineer (QAE)

The QAE role's challenge involves rigorous testing of the application's interface and backend functionality to ensure it meets all specified requirements. Candidates will be expected to manually test the application, develop test cases, and report on usability, as well as functional flaws. The detailed scrutiny required to perform these tasks effectively will test the QAE's meticulous attention to detail and their ability to think critically about the usability and functionality of complex systems. They must also demonstrate expertise in performance testing, requiring a solid understanding of both the front-end and database performance issues, identifying bottlenecks, and providing actionable feedback for optimization.

### Database Engineer (DBE)

DBE candidates will tackle challenges centered on database schema design, implementation, and optimization. They will be required to write complex SQL queries and procedures to support high-volume data manipulation and retrieval operations that are crucial for the application's performance. The DBE's tasks will include optimizing queries for performance and scalability, designing robust database structures that support the application's functionality, and ensuring data integrity and security. Candidates will also face the challenge of setting up and tearing down test databases, which requires meticulous planning and understanding of the database's role within the broader application architecture.

## Dependencies

* IDE of Choice
  * Visual Studio Code
    * Windows:
      * winget install --id Microsoft.VisualStudioCode --source winget
    * Ubuntu:
      * sudo snap install --classic code
  * Visual Studio 2022
    * Windows:
      * winget install --id Microsoft.VisualStudio.2022.Community --source winget
* C#, .NET 8, Docker Resources
  * docker
    * docker pull mcr.microsoft.com/dotnet/sdk
    * docker pull mcr.microsoft.com/mssql/server
    * docker pull docker.io/library/redis
  * dotnet
    * dotnet workload update
    * dotnet workload install aspire
    * dotnet tool install -g Microsoft.Web.LibraryManager.Cli
  * powershell
    * Windows:
      * winget install --id Microsoft.PowerShell --source winget
    * Ubuntu:
      * sudo apt-get install -y powershell
* Docker Engine or Daemon installed and running
  * If on Windows use Linux support (WSL)
* PowerShell version >= 7.x

## Build and Run Projects

These instructions will be for running on a local developer machine after cloning the project.

1. Run the following to start the application.</br>
./start_app.ps1 </br>
This will start the application at: https://localhost:17286/

2. Run the following to stop the application.</br>
./stop_app.ps1

3. Run the following to execute the tests.</br>
./run_tests.ps1
