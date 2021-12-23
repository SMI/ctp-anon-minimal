#!/usr/bin/env bash

set -uo pipefail

if [ $# -ne 1 ]; then
    echo "Error: Usage $0 jar_name"
    exit 1
fi

set -ex

unzip -p "$1" META-INF/MANIFEST.MF
