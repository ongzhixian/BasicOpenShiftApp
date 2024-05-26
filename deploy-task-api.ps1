oc new-build --name=links-api --image-stream="oc-sandbox/dotnet:6.0" --strategy=source --binary=true
oc new-build --name=links-api --image-stream="oc-sandbox/dotnet:6.0" --strategy=source .\links-api\

dotnet publish .\links-api\ --configuration Release
oc start-build links-api --from-dir=./links-api/bin/Release/net6.0/publish/ --follow --wait