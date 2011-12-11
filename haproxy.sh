#!/bin/bash
HAPROXY_VERSION="1.4.18"
HAPROXY_TARGET="generic"

set -o errexit
cd build

HAPROXY_TAR=haproxy-${HAPROXY_VERSION}.tar.gz

curl -C - -O http://haproxy.1wt.eu/download/1.4/src/${HAPROXY_TAR}
tar -xzf ${HAPROXY_TAR}
rm ${HAPROXY_TAR}
make -C haproxy-${HAPROXY_VERSION} install
