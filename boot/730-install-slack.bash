#!/usr/bin/env bash
dir=$(dirname $(readlink -f $0))

apt-get install -y \
    gconf2 \
    gconf-service \
    python \
    libgnome-keyring0 \
    gir1.2-gnomekeyring-1.0 \
    libappindicator1 \
&& ${dir}/install-deb-from-url.bash 'https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb'

