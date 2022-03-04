# Build the InterviewChallenge.WebApi project
Set-Location .\Src\Docker\InterviewChallenge.Api\
dotnet build --configuration Release --source .\InterviewChallenge.Api.sln --source ..\..\..\Nuget\nuget.config /p:Configuration=Docker
docker build -f ".\InterviewChallenge.Api\Dockerfile" --force-rm -t kb7ppbimagestore.azurecr.io/interviewchallengeapi:latest  --label "com.microsoft.created-by=visual-studio" --label "com.microsoft.visual-studio.project-name=InterviewChallenge.Api" ".\"
docker push kb7ppbimagestore.azurecr.io/interviewchallengeapi:latest

# Build the InterviewChallenge.WebApp project
Set-Location ..\InterviewChallenge.App\
dotnet build --configuration Release --source .\InterviewChallenge.App.sln --source ..\..\..\Nuget\nuget.config /p:Configuration=Docker
docker build -f ".\InterviewChallenge.App\Dockerfile" --force-rm -t kb7ppbimagestore.azurecr.io/interviewchallengeapp:latest  --label "com.microsoft.created-by=visual-studio" --label "com.microsoft.visual-studio.project-name=InterviewChallenge.App" ".\"
docker push kb7ppbimagestore.azurecr.io/interviewchallengeapp:latest

Set-Location ..\..\..