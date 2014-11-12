#!/bin/bash

# check if packer is installed
if type packer >/dev/null 2>&1; then
    echo "packer is already installed on this system"
elif type .packer/packer >/dev/null 2>&1; then
    echo "found packer in .packer, using this version"
    export PATH=$PATH:`pwd`/.packer
else
    echo "getting packer...";
    wget -q https://dl.bintray.com/mitchellh/packer/packer_0.7.2_linux_amd64.zip
    unzip -q packer_0.7.2_linux_amd64.zip -d .packer
    rm packer_0.7.2_linux_amd64.zip
    echo "packer is downloaded to .packer, using this version"
    export PATH=$PATH:`pwd`/.packer
fi
