# Run the automated tests
Set-Location .\Src\
dotnet build --configuration Debug --source .\InterviewChallenge.sln

Set-Location .\InterviewChallenge.AppHost\
dotnet run InterviewChallenge.AppHost\InterviewChallenge.AppHost.csproj &

Set-Location ..\..
