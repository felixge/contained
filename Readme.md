# 12Factor app container

# Config

## Haproxy

* **HAPROXY_VERSION:** The haproxy version to download and build. (Default: `1.4.18`)
* **HAPROXY_TARGET:** The OS to optimize for, see Haproxy's Makefile. (Default: `generic`).

# Dependencies

* bash
* curl

## Requirements for stack

* Load balancer
* SSL Termination
* Domain handling (?)
* Allow apps to schedule cron jobs

## Other ideas

* Tell processes to stop listening, with option to tell them to listen again
