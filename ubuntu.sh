#!/bin/bash

: <<'END_COMMENT'
This script performs the following actions on a Docker instance:
  1. Updates the Docker instance's system packages.
  2. Installs necessary dependencies such as curl, wget, git, and other build tools.
  3. Installs the Rust programming language.
  4. Installs DataSurgeon from its GitHub repository.
  5. Renames the DataSurgeon executable to include its version and platform details.

Usage:
  ./ubuntu.sh

To copy the executable from this Docker container to your local machine:
  1. On your host machine, find the container's ID with:
     docker ps

  2. Note the ID of your running container.

  3. Use docker cp to copy the executable:
     docker cp CONTAINER_ID:/usr/local/bin/ds-v${DS_VERSION}-debian-aarch64 /path/on/your/host/machine
END_COMMENT

#!/bin/bash

DS_VERSION="1.2.4"

# Update the docker instance
apt update && apt upgrade -y

# Install the dependencies 
apt install -y curl wget git pkg-config libssl-dev build-essential

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install DataSurgeon
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/Drew-Alleman/DataSurgeon/main/install/install.sh | sh

# If DataSurgeon is successfully compiled and exists at the mentioned path, move and rename it. Otherwise, display a message.
if [ -f /DataSurgeon/target/release/ds ]; then
    mv /DataSurgeon/target/release/ds /DataSurgeon/target/release/ds-v${DS_VERSION}-debian-aarch64
else
    echo "DataSurgeon binary '/DataSurgeon/target/release/ds' was not found!"
fi



