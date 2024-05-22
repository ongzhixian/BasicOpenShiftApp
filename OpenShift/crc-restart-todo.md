# CRC restart TODOs

oc new-project oc-sandbox

oc describe is dotnet
oc apply -f https://raw.githubusercontent.com/redhat-developer/s2i-dotnetcore/main/dotnet_imagestreams.json



oc new-build --binary=true --name=hello-world-app --strategy=source --image-stream="openshift/dotnet:6.0"
oc start-build pptx-api --from-dir=./bin/Debug/net6.0 --follow

oc new-build --binary=true --name=pptx-api --strategy=source --image-stream="openshift/dotnet:6.0"
dotnet publish -f net6.0 -c Release
oc start-build pptx-api --from-dir=./bin/Release/net6.0/publish --follow
oc new-app pptx-api


oc create service clusterip pptx-api --tcp=80:5250
oc expose service pptx-api
oc get routes pptx-api


## Create project
## Create ImageStreams (IS)
oc apply -f https://raw.githubusercontent.com/redhat-developer/s2i-dotnetcore/main/dotnet_imagestreams.json
oc replace -f https://raw.githubusercontent.com/redhat-developer/s2i-dotnetcore/master/dotnet_imagestreams.json

## Create App
oc new-app /home/user/code/myapp --strategy=docker


## Deploy applications from binaries Create BuildConfig using S2I

oc new-build --binary=true --name=pptx-api --strategy=source --image-stream="openshift/dotnet:6.0"
oc start-build pptx-api --from-dir=./bin/Release/net6.0/publish --follow
oc new-app pptx-api

## Deploy application from source

oc new-app --name=example-app 'dotnet:6.0-ubi8~https://github.com/redhat-developer/s2i-dotnetcore-ex#{dotnet-branch}' --build-env DOTNET_STARTUP_PROJECT=app

oc logs -f bc/example-app
oc logs -f dc/example-app



## Create Deployment



## Reference


https://github.com/redhat-developer/s2i-dotnetcore


https://access.redhat.com/documentation/en-us/net/8.0
https://access.redhat.com/documentation/en-us/net/8.0/html-single/getting_started_with_.net_on_openshift_container_platform/index
https://access.redhat.com/documentation/en-us/net/6.0/html/getting_started_with_.net_on_rhel_8/index

