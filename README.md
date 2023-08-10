# ds-docker-scripts
Scripts I use within a docker instance to compile DataSurgeon for the release pages.

## Docker Setup Scripts
These are scripts I run ON a docker instance to compile the program. These scripts were designed to be run as root in the root directory. (```cd /```).

### Ubuntu
```
wget https://raw.githubusercontent.com/Drew-Alleman/ds-docker-scripts/main/ubuntu.sh && chmod +x ubuntu.sh && ./ubuntu.sh
```
then to copy it
```
docker cp ID:/DataSurgeon/target/release/ds-vVERSION-debian-aarch64 C://Users//DrewQ/Desktop/ds-vVERSION-debian-aarch64
```
### Fedora 
```
wget https://raw.githubusercontent.com/Drew-Alleman/ds-docker-scripts/main/fedora.sh && chmod +x fedora.sh && ./fedora.sh
```
then to copy it
```
docker cp ID:/DataSurgeon/target/release/ds-vVERSION-fedora-x86_64 C://Users//DrewQ//Desktop//ds-vVERSION-fedora-x86_64
```
### Manjaro 
To start the docker
```
C:\Users\Drew>docker run -t -i manjarolinux/base /bin/bash
[root]#
```
To download the setup script
```
curl https://raw.githubusercontent.com/Drew-Alleman/ds-docker-scripts/main/manjaro.sh > manjaro.sh && chmod +x manjaro.sh && ./manjaro.sh
```
then to copy it
```
docker cp ID:/DataSurgeon/target/release/ds-v${DS_VERSION}-manj C://Users//DrewQ//Desktop//ds-v${DS_VERSION}-manj
```
