#!/usr/bin/env bash

set -euxo pipefail

OUT="./src-generated"

rm -rf "$OUT"
mkdir -p "$OUT"/main/java
mkdir -p "$OUT"/main/resources

cp -r vendor/CTP/source/java/* "$OUT"/main/java/

cp -r vendor/Util/source/java/* "$OUT"/main/java/

cp -r vendor/dcm4che-1.4-JP/src/java/* "$OUT"/main/java/
cp -r vendor/dcm4che-1.4-JP/build/generate/* "$OUT"/main/java/
cp -r vendor/dcm4che-1.4-JP/src/resources/* "$OUT"/main/resources/
cp -r vendor/dcm4che-1.4-JP/build/resources/* "$OUT"/main/resources/
