#!/bin/bash

set -ex
source $TRAVIS_BUILD_DIR/.travis/setup.sh
run $TRAVIS_BUILD_DIR/build_python27.sh
aws s3 cp $TRAVIS_BUILD_DIR/python27.tar.bz2 s3://$ASSETS_BUCKET/python27.tar.bz2
