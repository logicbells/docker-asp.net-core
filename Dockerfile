FROM microsoft/dotnet:sdk as build
RUN mkdir app
WORKDIR /app
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:aspnetcore-runtime
WORKDIR /app
COPY --from=build /app/out/. .
CMD dotnet test.dll