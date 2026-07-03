#!/usr/bin/env sh
set -eu
abi=${1:-}
case "$abi" in
  armeabi-v7a)
    triple=armv7a-linux-androideabi
    api=21
    cc="${triple}${api}-clang"
    ;;
  arm64-v8a)
    triple=aarch64-linux-android
    api=21
    cc="${triple}${api}-clang"
    ;;
  *)
    echo "unsupported ABI: $abi" >&2
    exit 64
    ;;
esac
: "${ANDROID_NDK_HOME:=${ANDROID_NDK_ROOT:-}}"
if [ -z "${ANDROID_NDK_HOME}" ]; then
  echo "ANDROID_NDK_HOME/ANDROID_NDK_ROOT is required" >&2
  exit 69
fi
clang="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/${cc}"
mkdir -p dist
report="dist/android-${abi}-abi-report.txt"
{
  echo "abi=${abi}"
  echo "api=${api}"
  echo "compiler=${clang}"
  "$clang" --version | sed -n '1p'
  echo "status=toolchain-present"
} > "$report"
test -x "$clang"
