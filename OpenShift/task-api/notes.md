# Notes

An example of using OpenShift to build a container image from source code and store the container image in an external container image registry like DockerHub


## Create secret for docker registry and secret to builder  

oc create secret docker-registry --docker-server=docker.io --docker-username=dockerusername --docker-password=dockerpassword --docker-email=your@email.com docker-login
 
oc secret link builder docker-login --for=mount


## Build strategy

oc new-build --name=task-api --image-stream="oc-sandbox/dotnet:6.0" --strategy=source --binary=true
oc start-build task-api --from-dir=./task-api/bin/Release/net6.0/publish/ --follow --wait







oc new-build --name=task-api --to-docker --to=docker.io/zhixian/task-api --image-stream="oc-sandbox/dotnet:6.0" --strategy=source --binary=true
oc start-build task-api --from-dir=./task-api/bin/Release/net6.0/publish/ --follow --wait
FAILED! Think this is too heavy on build ephemeral-storage
```
The node was low on resource: ephemeral-storage. Threshold quantity: 4902142351, available: 4528764Ki. Container sti-build was using 3888Ki, request is 0, has larger consumption of ephemeral-storage. 
```


S2I
oc new-build --name=task-api --to-docker --to=docker.io/zhixian/task-api --image=mcr.microsoft.com/dotnet/aspnet:6.0 --strategy=source --binary=true

FAILED! Will hit 
```
STEP 8/9: RUN /usr/libexec/s2i/assemble
/bin/sh: 1: /usr/libexec/s2i/assemble: not found
error: build error: building at STEP "RUN /usr/libexec/s2i/assemble": while running runtime: exit status 127
error: the build oc-sandbox/task-api-1 status is "Failed"
```


oc new-build .\task-api\ --name=task-api --to-docker --to=docker.io/zhixian/task-api --image=mcr.microsoft.com/dotnet/aspnet:6.0 --strategy=source
FAILED! Same error as above
I think the problem is with base image

oc new-build .\task-api\ --name=task-api --to-docker --to=docker.io/zhixian/task-api --image=mcr.microsoft.com/dotnet/aspnet:6.0 --strategy=docker
FAILED! Requires Dockerfile
```
error: No Dockerfile was found in the repository and the requested build strategy is 'docker'
```




oc new-build .\task-api\ --name=task-api --to-docker --to=docker.io/zhixian/task-api


oc new-build . --name=hello-world-php --to-docker --to=docker.io/dockerusername/hello-world-php




dotnet publish .\task-api\ --configuration Release
 
oc start-build task-api --from-dir=./task-api/bin/Release/net6.0/publish/ --follow --wait


oc new-build --binary=true --name=task-api --strategy=source --image-stream="openshift/dotnet:6.0"



# Reference

https://edwin.baculsoft.com/2022/03/how-to-connect-openshift-buildconfig-to-docker-hub/