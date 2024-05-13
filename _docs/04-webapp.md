# Publisj

dotnet publish .\weather-forecast-api\ --configuration Release
oc new-build --name=weather-forecast-api dotnet:6.0-ubi8 --binary=true
oc start-build weather-forecast-api --from-dir=.\weather-forecast-api\bin\Release\net6.0\publish
oc new-app my-web-app