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
    echo '[AutoRun]
    enabled=true
    program="/content/rclone --config=\"/content/rclone1/rclone.conf\" move \"%F\" \"drive:/nata/%N\""
    [BitTorrent]
    Session\DefaultSavePath=/content/qBittorrent/downloads
    Session\ExcludedFileNames=
    Session\GlobalMaxRatio=0
    Session\QueueingSystemEnabled=true
    Session\TempPath=/content/qBittorrent/downloads/temp
    [LegalNotice]
    Accepted=true
    [Preferences]
    WebUI\AuthSubnetWhitelistEnabled=false
    WebUI\Address=*
    WebUI\ServerDomains=*
    WebUI\Port=10156
    WebUI\HostHeaderValidation=false
    WebUI\ClickjackingProtection=false
    WebUI\CSRFProtection=false
    WebUI\LocalHostAuth=true' > /content/qBittorrent/config/qBittorrent.conf
fi

