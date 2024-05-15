#Setup dotnet test run argument
[string] $loggerArgument = '"trx;logfilename=Test_Results.' + (Get-Date).ToString("yyyyMMdd.HHmmss") + '.trx"'

# Run the automated tests
Set-Location .\Src\InterviewChallenge.Tests\
dotnet build --configuration Debug --source .\InterviewChallenge.Tests.sln
dotnet test .\InterviewChallenge.Tests.sln --logger $loggerArgument #--collect:"Code Coverage"

Set-Location ..\..