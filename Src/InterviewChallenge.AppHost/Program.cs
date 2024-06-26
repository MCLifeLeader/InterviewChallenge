var builder = DistributedApplication.CreateBuilder(args);

var cache = builder.AddRedis("rediscache");

var apiService = builder.AddProject<Projects.InterviewChallenge_ApiService>("apiservice");

builder.AddProject<Projects.InterviewChallenge_Web>("webfrontend")
    .WithExternalHttpEndpoints()
    .WithReference(cache)
    .WithReference(apiService);

builder.Build().Run();
