#!/usr/bin/env bash

set -euxo pipefail

VENDOR_ROOT="$(pwd)/vendor"
PATCHES_ROOT="$(pwd)/patches"

readarray -d '' vendor_paths < <(find "$VENDOR_ROOT" -mindepth 1 -maxdepth 1 -type d -print0)

for vendor_path in "${vendor_paths[@]}"
do
    vendor_patch_path="$PATCHES_ROOT/$(basename "$vendor_path")"
    [ ! -d "$vendor_patch_path" ] && continue
    pushd "$vendor_path"
    git apply "$vendor_patch_path"/*
    popd
done
