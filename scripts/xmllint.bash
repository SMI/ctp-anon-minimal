#!/usr/bin/env bash

set -uo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 xml_file"
    exit 1
fi

set -ex

infile="$1"

XMLLINT_INDENT="    " xmllint --format "$infile" > "$infile".tmp
mv "$infile".tmp "$infile"
