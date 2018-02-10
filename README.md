# zato-build-rhel6

This repository contains a ``.travis.yml`` that causes a Python 2.7 interpreter
to be build for Red Hat Enterprise Linux 6, that installs to
``/opt/zato/current/python2.7``.

The resulting prefix is tarred up and saved to Amazon S3, as
https://travis-ci-integration.amazonaws.com/python27/python2.7.13.tar.bz2,
where it can be accessed from subsequent Travis jobs.
