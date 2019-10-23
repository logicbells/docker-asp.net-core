FROM mcr.microsoft.com/dotnet/core/sdk:3.0.100

RUN mkdir app
WORKDIR /app
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o out

# Make sure the app binds to port 8080
ENV ASPNETCORE_URLS http://*:8080

# Run the web service on container startup.
CMD ["dotnet", "out/test.dll"]