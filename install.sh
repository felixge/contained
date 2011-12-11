set -o errexit

if [ ! -d build ]; then mkdir build; fi

bash ./common.sh
bash ./haproxy.sh
