FROM mcr.microsoft.com/dotnet/core/sdk:2.1 AS build 
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release
FROM mcr.microsoft.com/dotnet/core/aspnet:2.1
COPY --from=build /output /app
WORKDIR /app 
ENTRYPOINT ["dotnet", "AspNetCoreOnDocker.dll"]