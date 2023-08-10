#!/bin/bash

: <<'END_COMMENT'
This script performs the following actions on a Fedora Docker instance:
  1. Updates the Docker instance's system packages.
  2. Installs necessary dependencies such as curl, wget, git, and other build tools.
  3. Installs the Rust programming language.
  4. Installs DataSurgeon from its GitHub repository.
  5. Renames the DataSurgeon executable to include its version and platform details.

Usage:
  ./fedora.sh

To copy the executable from this Docker container to your local machine:
  1. On your host machine, find the container's ID with:
     docker ps

  2. Note the ID of your running container.

  3. Use docker cp to copy the executable:
     docker cp CONTAINER_ID:/DataSurgeon/target/release/ds-v${DS_VERSION}-fedora-x86_64 /path/on/your/host/machine
END_COMMENT

DS_VERSION="1.2.4"

# Update the docker instance
dnf update -y

# Install the dependencies 
dnf install -y curl wget git pkg-config openssl-devel gcc-c++ make

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
# Install DataSurgeon
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/Drew-Alleman/DataSurgeon/main/install/install.sh | sh

# If DataSurgeon is successfully compiled and exists at the mentioned path, move and rename it. Otherwise, display a message.
if [ -f /DataSurgeon/target/release/ds ]; then
    mv /DataSurgeon/target/release/ds /DataSurgeon/target/release/ds-v${DS_VERSION}-fedora-x86_64
else
    echo "DataSurgeon binary '/DataSurgeon/target/release/ds' was not found!"
fi
