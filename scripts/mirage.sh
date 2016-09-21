#!/bin/sh

set -ex

sudo apt-get install -y libssl-dev pkg-config # required by many mirage apps
opam install mirage --yes                     # install mirage
opam install -y -j 2 -v depext
opam depext -u jitsu-libxl
opam install -y -j 2 -v jitsu-libxl