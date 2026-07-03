#!/usr/bin/env sh
set -eu
make -C src clean >/dev/null 2>&1 || true
make -C src loader.exe loader-m32.exe build.h proot
./src/proot --version >/dev/null
