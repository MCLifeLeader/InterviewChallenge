#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["InterviewChallenge.Api/InterviewChallenge.Api.csproj", "InterviewChallenge.Api/"]
RUN dotnet restore "InterviewChallenge.Api/InterviewChallenge.Api.csproj"
COPY . .
WORKDIR "/src/InterviewChallenge.Api"
RUN dotnet build "InterviewChallenge.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "InterviewChallenge.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "InterviewChallenge.Api.dll"]