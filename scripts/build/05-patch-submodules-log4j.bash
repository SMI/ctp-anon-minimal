#!/usr/bin/env bash

set -euxo pipefail

VENDOR_ROOT="$(pwd)/vendor"

readarray -d '' java_paths < <(find "$VENDOR_ROOT" -type f -name "*.java" -print0)

for f in "${java_paths[@]}"
do
    # Fix namespaces
    sed -i 's/apache.log4j/apache.logging.log4j/' "$f"
    # Fix getLogger call
    sed -i 's/Logger.getLogger/LogManager.getLogger/' "$f"
    # Add LogManager import
    sed -i '/import org.apache.logging.log4j.Logger;/a import org.apache.logging.log4j.LogManager;' "$f"
done
