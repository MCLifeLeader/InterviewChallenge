[string] $launch_profile = $args[0]

if ($null -eq $launch_profile -or $launch_profile -eq "") {
    Write-Host "* * * *"
    Write-Host "Valid arguments are 'http', 'https', or 'httpsalt'. Defaulting to 'https'."
    Write-Host "* * * *"
    $launch_profile = "https"    
}

Write-Host "Starting Application Services..."

# Start the application
Set-Location .\Src\
dotnet build --configuration Debug --source .\InterviewChallenge.sln

Set-Location .\InterviewChallenge.AppHost\
dotnet run InterviewChallenge.AppHost\InterviewChallenge.AppHost.csproj --configuration Debug --launch-profile $launch_profile &

Set-Location ..\..

#Start-Sleep -Seconds 5
#start msedge "https://localhost:17286"