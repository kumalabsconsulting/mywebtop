#!/bin/bash


echo "**** Start packages.sh script ****"
echo ""
echo "**** add docker gpg keystring ****"
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
rm -rf /etc/apt/sources.list.d/docker.list
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo ""
echo "**** add repo brave browser ****"
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
echo ""
echo "**** install packages ****"
apt-get update
DEBIAN_FRONTEND=noninteractive
apt-get install --no-install-recommends -y brave-browser wget gpg vim

echo "**** cleanup ****"
apt-get autoclean
rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

echo ""
echo "**** End of packages.sh script ****"