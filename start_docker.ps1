# Run the InterviewChallenge.WebApi container
Start-Process -FilePath 'docker' -ArgumentList 'run -it -p 42080:80 -p 42443:443 --name InterviewChallengeApi interviewchallengeapi:latest'

# Run the InterviewChallenge.WebApp container
Start-Process -FilePath 'docker' -ArgumentList 'run -it -p 43080:80 -p 43443:443 --name InterviewChallengeApp interviewchallengeapp:latest'