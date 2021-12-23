#!/usr/bin/env bash

set -uo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 new-version"
    exit 1
fi

set -ex

VER="${1#v}"

mvn \
    -ntp \
    versions:set \
    -DnewVersion="$VER" \
    -DgenerateBackupPoms=false

mvn \
    -ntp \
    -f integration/pom.xml \
    versions:use-dep-version \
    -Dincludes=uk.ac.ed.epcc:ctpanonymiser_minimal \
    -DdepVersion="$VER" \
    -DforceVersion=true \
    -DgenerateBackupPoms=false
