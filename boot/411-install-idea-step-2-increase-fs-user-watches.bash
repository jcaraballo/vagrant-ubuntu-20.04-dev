#!/usr/bin/env bash

echo 'Increasing fs.inotify.max_user_watches for IntelliJ (needs superuser)'
echo fs.inotify.max_user_watches=524288 >> /etc/sysctl.conf
sysctl -p --system

