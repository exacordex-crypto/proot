proot
=====
[![Travis build status](https://travis-ci.org/termux/proot.svg?branch=master)](https://travis-ci.org/termux/proot)

This is a copy of [the PRoot project](https://github.com/proot-me/PRoot/) with patches applied to work better under [Termux](https://termux.com).

Build and release status
------------------------

The maintained build path is the native `proot` executable. GitHub Actions
builds and tests the Linux binary, uploads a native release archive, and checks
that the Android NDK toolchains for `armeabi-v7a` and `arm64-v8a` are available.
See `doc/howto-android-ci.txt` for the current Android/NDK contract and why this
repository does not currently emit signed or unsigned APKs.
