dotnet publish -f net6.0 -c Release
if ($? -eq $true) { oc start-build pptx-api --from-dir=./bin/Release/net6.0/publish --follow }
