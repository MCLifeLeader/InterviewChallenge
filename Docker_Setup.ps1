# Setup Docker Services

if (Get-Command docker -ErrorAction SilentlyContinue) {
    Write-Host "Pulling Docker images if missing."

    ## Pull the Docker images
    #docker pull mcr.microsoft.com/azure-storage/azurite
    #docker pull mcr.microsoft.com/dotnet/sdk
    #docker pull mcr.microsoft.com/dotnet/aspnet
    #docker pull mcr.microsoft.com/mssql/server
    #docker pull docker.io/library/redis

    ## Start the vs multi-container
    docker-compose -f "./containers/docker-compose.yml" -p interview up -d
}

Write-Host "Head back to  README.md  for deployment of the database and other services..."
