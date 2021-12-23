#!/usr/bin/env bash

set -euxo pipefail

rm -rf vendor/*

git submodule update --init --recursive
