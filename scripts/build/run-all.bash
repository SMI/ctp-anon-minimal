#!/usr/bin/env bash

set -euxo pipefail

HERE="$(dirname "$(realpath "$0")")"

readarray scripts < <(find "$HERE" -type f | grep -v "$0" | sort -n)

set +x

for script in "${scripts[@]}"
do
    echo -e "\n=== $(basename "$script") ==="
    $script
done
