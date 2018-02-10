#!/bin/bash

set -ex

sudo yum -y install \
    bzip2 bzip2-devel cyrus-sasl-devel gcc-c++ git haproxy \
    keyutils-libs-devel libev libev-devel libevent-devel libffi libffi-devel \
    libxml2-devel libxslt-devel libyaml-devel openldap-devel openssl \
    openssl-devel patch postgresql-devel python-devel suitesparse swig uuid \
    uuid-devel wget

wget -P /tmp "$PYTHON_URL"
tar -C /tmp -zxf "/tmp/Python-$PYTHON_VER.tgz"
cd "/tmp/Python-$PYTHON_VER"
./configure --quiet --prefix="$PYTHON_PREFIX"

# Travis CI always has at least 2 vCPUs.
make -j 2 >/dev/null
sudo make altinstall >/dev/null

tar -jcf /tmp/python27.tar.bz2 "$PYTHON_PYTHON"
aws s3 cp /tmp/python27.tar.bz2 s3://$ASSETS_BUCKET/python27.tar.bz2
