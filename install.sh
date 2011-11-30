set -o errexit

echo "Building 12-stack"
echo "Deleting build folder"
rm -rf build
mkdir -p build/{bin,src}

cd build
bash ../stack/haproxy.sh

pwd
