#!/bin/bash
HAPROXY_VERSION=${HAPROXY_TARGET:-1.4.18}
HAPROXY_TARGET=${HAPROXY_TARGET:-linux26}
HAPROXY_CHROOT=${HAPROXY_CHROOT:-/var/chroot/haproxy}

set -o errexit
cd build

HAPROXY_TAR=haproxy-${HAPROXY_VERSION}.tar.gz

if [ ! -d haproxy-${HAPROXY_VERSION} ]; then
  curl -C - -O http://haproxy.1wt.eu/download/1.4/src/${HAPROXY_TAR}
  tar -xzf ${HAPROXY_TAR}
  rm ${HAPROXY_TAR}
fi

make -C haproxy-${HAPROXY_VERSION} install

if [ ! -d ${HAPROXY_CHROOT} ]; then mkdir -p ${HAPROXY_CHROOT}; fi
