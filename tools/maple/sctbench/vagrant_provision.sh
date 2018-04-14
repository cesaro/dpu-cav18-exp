#!/bin/bash
set -x
set -e
set -u

# apt-get update
sudo apt-get -y install \
  libprotobuf-dev \
  protobuf-compiler \
  python-protobuf \
  build-essential ipython m4 cmake


