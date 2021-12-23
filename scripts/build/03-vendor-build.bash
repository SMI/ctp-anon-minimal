#!/usr/bin/env bash

set -euxo pipefail

# NOTE(rkm 2021-12-21) This needs to be done before the log4j patches

pushd ./vendor/dcm4che-1.4-JP/
ant compile
ant compile-res
popd
