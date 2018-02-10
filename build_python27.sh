#!/bin/bash

set -ex

PYTHON_VER="2.7.13"
PYTHON_URL="https://www.python.org/ftp/python/$PYTHON_VER/Python-$PYTHON_VER.tgz"
PYTHON_PREFIX="/opt/zato/python/$PYTHON_VER"

sudo yum -y install bzip2 gcc-c++ git libffi-devel openssl-devel wget

wget -P /tmp "$PYTHON_URL"
tar -C /tmp -zxf "/tmp/Python-$PYTHON_VER.tgz"
cd "/tmp/Python-$PYTHON_VER"
./configure --quiet --prefix="$PYTHON_PREFIX"

# Travis CI always has at least 2 vCPUs.
make -j 2 >/dev/null
sudo make altinstall >/dev/null

sudo strip "$PYTHON_PREFIX/bin/python2.7"
sudo ln -fs "$PYTHON_PREFIX/bin/python2.7" "$PYTHON_PREFIX/bin/python"
sudo ln -fs "$PYTHON_PREFIX/bin/python2.7" "$PYTHON_PREFIX/bin/python2"

tar -jcf $TRAVIS_BUILD_DIR/python27.tar.bz2 "$PYTHON_PREFIX"
