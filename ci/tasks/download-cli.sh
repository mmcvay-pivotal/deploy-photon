#!/bin/bash +x
set -e

# Get Photon CLI
echo "Downloading Photon CLI..."
cli_url="https://bintray.com/photon-controller/esxcloud-archives/download_file?file_path=v0.9.0%2F106%2Fcli%2Fbin%2Flinuxamd64%2Fphoton"
if [[ $cli_url == "latest" || -z "$cli_url" ]]; then
  echo "Using default url."
  cli_url=$(wget -q -O- https://github.com/vmware/photon-controller/wiki/download | grep "linux cli tools" | egrep -o http.*\" | tr -d "\"")
fi
wget $cli_url -O /sbin/photon
chmod 755 /sbin/photon
