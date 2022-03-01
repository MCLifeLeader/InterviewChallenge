# Build the InterviewChallenge.WebApi project
Set-Location .\Src\Docker\InterviewChallenge.Api\
dotnet build --configuration Release --source .\InterviewChallenge.Api.sln --source ..\..\..\Nuget\nuget.config
docker build -f ".\InterviewChallenge.Api\Dockerfile" --force-rm -t interviewchallengeapi  --label "com.microsoft.created-by=visual-studio" --label "com.microsoft.visual-studio.project-name=InterviewChallenge.Api" ".\"

# Build the InterviewChallenge.WebApp project
Set-Location ..\InterviewChallenge.App\
dotnet build --configuration Release --source .\InterviewChallenge.App.sln --source ..\..\..\Nuget\nuget.config
docker build -f ".\InterviewChallenge.App\Dockerfile" --force-rm -t interviewchallengeapp  --label "com.microsoft.created-by=visual-studio" --label "com.microsoft.visual-studio.project-name=InterviewChallenge.App" ".\"

Set-Location ..\..\..