#!/bin/bash
set -o errexit

HAPROXY_VERSION=${HAPROXY_VERSION:-1.4.18}
HAPROXY_TARGET=${HAPROXY_TARGET:-generic}

echo "Downloading haproxy ${HAPROXY_VERSION} ..."

cd src
curl -o haproxy.tar.gz http://haproxy.1wt.eu/download/1.4/src/haproxy-${HAPROXY_VERSION}.tar.gz
tar -xzf haproxy.tar.gz
rm haproxy.tar.gz
mv haproxy-${HAPROXY_VERSION} haproxy
cd haproxy

echo "Compiling haproxy ..."
make TARGET=HAPROXY_TARGET

echo "Installing haproxy ..."
install haproxy ../../bin
