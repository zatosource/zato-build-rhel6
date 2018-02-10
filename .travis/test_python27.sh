#!/bin/bash

set -ex
source $TRAVIS_BUILD_DIR/.travis/setup.sh
run $TRAVIS_BUILD_DIR/build_python27.sh
