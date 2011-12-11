# 12Factor app container

# Config

## Haproxy

* **HAPROXY_VERSION:** The haproxy version to download and build. (Default: `1.4.18`)
* **HAPROXY_TARGET:** The OS to optimize for, see Haproxy's Makefile. (Default: `generic`).

# Dependencies

## Building

* build chain (TBD)
* bash
* curl

## Running

* Nothing

## Requirements for stack

* Load balancer

* SSL Termination (?)
* Domain handling (?)
* Cron jobs (?)
* Log routing (?)

# Big Picture

Operating System -> Stack -> Apps
