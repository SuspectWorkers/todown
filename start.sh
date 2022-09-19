#!/bin/bash

sudo apt update
sudo apt install wget curl -y
if [ -f "qbee" ]
then
    echo "qbee binary exists."
else
    wget -O qbee https://github.com/userdocs/qbittorrent-nox-static/releases/latest/download/x86_64-qbittorrent-nox
fi
mkdir -p qBittorrent/config/
if [ -f "qBittorrent/config/qBittorrent.conf" ]
then
    echo "qbee conf file exists."
else
    echo '[LegalNotice]
    Accepted=true
    [Preferences]
    WebUI\AuthSubnetWhitelistEnabled=false
    WebUI\Address=*
    WebUI\ServerDomains=*
    WebUI\Port=10156
    WebUI\HostHeaderValidation=false
    WebUI\ClickjackingProtection=false
    WebUI\CSRFProtection=false
    WebUI\LocalHostAuth=true' > qBittorrent/config/qBittorrent.conf
fi

