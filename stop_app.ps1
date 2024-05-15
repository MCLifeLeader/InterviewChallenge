# Get the list of all running jobs.
Get-Job

# To filter, first you need to assign the currently running jobs to a variable like $jobs.
$jobs = Get-Job

# Search the list of jobs for the one you want to stop.
$job = $jobs | Where-Object { $_.Command -like '*InterviewChallenge*' }

# Use either Stop-Job or Remove-Job to kill the job.
Stop-Job $job.Id
Remove-Job $job.Id

# Stop the Docker containers for the redis cache
docker stop $(docker ps -a -q --filter "name=cache*")
docker rm $(docker ps -a -q --filter "name=cache*")