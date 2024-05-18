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


## Console App

oc new-app .\my-console-app\ --image-stream="openshift/dotnet:6.0" --name='my-console-app'

  imagestream.image.openshift.io "basicopenshiftapp" created
  buildconfig.build.openshift.io "basicopenshiftapp" created
  deployment.apps "basicopenshiftapp" created
  service "basicopenshiftapp" created


## Source build
    
oc new-build --binary=true --name=hello-world-app --strategy=source --image-stream="openshift/dotnet:6.0"

    imagestream.image.openshift.io "hello-world-app" created
    buildconfig.build.openshift.io "hello-world-app" created

oc start-build hello-world-app --from-dir=./bin/Debug/net6.0 --follow

    * A source build using binary input will be created
      * The resulting image will be pushed to image stream tag "hello-world-app:latest"
      * A binary build was created, use 'oc start-build --from-dir' to trigger a new build


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



## IMagestreams

oc create -f https://raw.githubusercontent.com/redhat-developer/s2i-dotnetcore/master/dotnet_imagestreams.json



## Reference


https://catalog.redhat.com/software/containers/search

https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image?extIdCarryOver=true&intcmp=701f2000001OMHaAAO&sc_cid=701f2000001OH7EAAW

https://redhat-scholars.github.io/openshift-starter-guides/rhs-openshift-starter-guides/4.11/mlbparks-binary-build.html
https://docs.openshift.com/dedicated/3/dev_guide/dev_tutorials/binary_builds.html
