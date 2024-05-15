# Start the application
Set-Location .\Src\
dotnet build --configuration Debug --source .\InterviewChallenge.sln

Set-Location .\InterviewChallenge.AppHost\
dotnet run InterviewChallenge.AppHost\InterviewChallenge.AppHost.csproj --configuration Debug --launch-profile https &

Set-Location ..\..

#Start-Sleep -Seconds 5
#start msedge "https://localhost:17286"