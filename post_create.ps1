# Setup Development Environment DevContainer
Write-Host "Post Create Commands for Environment..."

dotnet workload update
dotnet workload install aspire
dotnet tool install -g Microsoft.Web.LibraryManager.Cli

Set-Location ./Src/

Set-Location ./InterviewChallenge.ApiService
dotnet restore InterviewChallenge.ApiService.csproj

Set-Location ../InterviewChallenge.AppHost
dotnet restore InterviewChallenge.AppHost.csproj

Set-Location ../InterviewChallenge.ServiceDefaults
dotnet restore InterviewChallenge.ServiceDefaults.csproj

Set-Location ../InterviewChallenge.Web
dotnet restore InterviewChallenge.Web.csproj
libman restore

Set-Location ../InterviewChallenge.Tests
dotnet restore InterviewChallenge.Tests.csproj

Set-Location ../..

# Setup git Configurations
git config --global credential.useHttpPath true
