#!/bin/bash

set -ex
source $TRAVIS_BUILD_DIR/.travis/setup.sh

PYTHON_VER="2.7.13"
PYTHON_URL="https://www.python.org/ftp/python/$PYTHON_VER/Python-$PYTHON_VER.tgz"
PYTHON_PREFIX="/opt/zato/python/$PYTHON_VER"
PATH="$PYTHON_PREFIX/bin:$PATH"

run $TRAVIS_BUILD_DIR/build_python27.sh
