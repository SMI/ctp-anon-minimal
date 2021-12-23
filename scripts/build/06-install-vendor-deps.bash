#!/usr/bin/env bash

set -euxo pipefail

pushd vendor/CTP/libraries/imageio

mvn -ntp \
     org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file \
    -Dfile=jai_imageio-1.2-pre-dr-b04.jar

mvn -ntp \
    install:install-file \
    -Dfile=pixelmed_codec.jar \
    -DgroupId=com.pixelmed.codec.jpeg \
    -DartifactId=pixelmed_codec \
    -Dversion=1.0 \
    -Dpackaging="jar" \
    -DgeneratePom="true"

popd
