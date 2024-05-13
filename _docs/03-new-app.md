# oc new-app CLI


oc apply [-n namespace] -f oc apply [-n namespace] -f

oc apply -f https://raw.githubusercontent.com/redhat-developer/s2i-dotnetcore/main/dotnet_imagestreams.json
oc replace -f https://raw.githubusercontent.com/redhat-developer/s2i-dotnetcore/master/dotnet_imagestreams.json

When you execute `oc new-app .\weather-forecast-api\ --image-stream="openshift/dotnet:6.0-ubi8"`, it create the following resource:

imagestream.image.openshift.io  "basicopenshiftapp" created
buildconfig.build.openshift.io  "basicopenshiftapp" created
deployment.apps                 "basicopenshiftapp" created
service                         "basicopenshiftapp" created



`oc new-app .\weather-forecast-api\ --image-stream="openshift/dotnet:6.0-ubi8" --name='weather-forecast-api'`

Creating resources ...
imagestream.image.openshift.io  "weather-foreacast-api" created
buildconfig.build.openshift.io  "weather-foreacast-api" created
deployment.apps                 "weather-foreacast-api" created
service                         "weather-foreacast-api" created


oc logs -f buildconfig/weather-foreacast-api

# Commands

oc new-app --list

The argument "dotnet" could apply to the following container images, OpenShift image streams, or templates:

* Image stream "dotnet" (tag "7.0-ubi8") in project "openshift"
  Use --image-stream="openshift/dotnet:7.0-ubi8" to specify this image or template

* Image stream "dotnet" (tag "6.0") in project "openshift"
  Use --image-stream="openshift/dotnet:6.0" to specify this image or template

* Image stream "dotnet" (tag "6.0-ubi8") in project "openshift"
  Use --image-stream="openshift/dotnet:6.0-ubi8" to specify this image or template

* Image stream "dotnet" (tag "7.0") in project "openshift"
  Use --image-stream="openshift/dotnet:7.0" to specify this image or template

* Image stream "dotnet" (tag "8.0") in project "openshift"
  Use --image-stream="openshift/dotnet:8.0" to specify this image or template

To view a full list of matches, use 'oc new-app -S dotnet'

