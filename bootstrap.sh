#!/usr/bin/env bash

VH=/home/vagrant
BOOT=/vagrant/boot
RESOURCES=/vagrant/resources

IDEA_URL='https://download-cf.jetbrains.com/idea/ideaIU-2018.2.tar.gz'
WEBSTORM_URL='https://download-cf.jetbrains.com/webstorm/WebStorm-2018.1.2.tar.gz'
NODE_URL='https://nodejs.org/dist/v8.10.0/node-v8.10.0-linux-x64.tar.xz'
JDK_TAR_PATH=$( ${BOOT}/path_of_single_file_in_dir.bash ${RESOURCES}/jdk )

DOCKER_COMPOSER_VERSION=1.22.0
DOCKER_MACHINE_VERSION=0.15.0

export DEBIAN_FRONTEND=noninteractive

${BOOT}/010-install-sbt-step-1-add-apt-sources.bash

echo ----------------------------------------------------------------
echo Updating apt sources
until apt-get update ; do echo retrying updating apt sources... ; done
echo Updating packages
until apt-get -y upgrade ; do echo retrying updating packages... ; done
echo ----------------------------------------------------------------
echo
echo

sudo -Hu vagrant ${BOOT}/101-maybe-set-up-ssh-keys.bash ${RESOURCES}/ssh-keys
sudo -Hu vagrant ${BOOT}/102-set-up-known_hosts.bash github.com bitbucket.org

${BOOT}/210-install-curl.bash
${BOOT}/220-install-sbt-step-2-apt-get-install.bash
${BOOT}/230-install-tree.bash
${BOOT}/240-install-gitk.bash
sudo -Hu vagrant ${BOOT}/241-set-up-git.bash ${RESOURCES}/git/email ${RESOURCES}/git/name

${BOOT}/301-install-java.bash "$JDK_TAR_PATH"

sudo -Hu vagrant ${BOOT}/410-install-idea-step-1-install.bash "$IDEA_URL" "${VH}/tools"
${BOOT}/411-install-idea-step-2-increase-fs-user-watches.bash
sudo -Hu vagrant ${BOOT}/412-maybe-copy-idea-config.bash ${RESOURCES}/idea-config "${VH}"

sudo -Hu vagrant ${BOOT}/420-install-webstorm.bash "$WEBSTORM_URL" "${VH}/tools"

${BOOT}/510-install-node-all-users.bash "$NODE_URL"

echo Installing yarn
sudo -Hu vagrant ${BOOT}/520-install-yarn.bash

echo 'Installing Conscript and g8 (g8 needs cs)'
sudo -Hu vagrant ${BOOT}/610-install-conscript.bash
sudo -Hu vagrant ${BOOT}/611-install-g8.bash

echo 'Installing heroku cli'
${BOOT}/620-install-heroku-cli.bash

echo 'Installing Docker CE'
${BOOT}/701-install-docker-ce.bash vagrant

echo 'Installing Docker Compose'
${BOOT}/702-install-docker-compose.bash "$DOCKER_COMPOSER_VERSION"

echo 'Installing Docker Machine'
${BOOT}/703-install-docker-machine.bash "$DOCKER_MACHINE_VERSION"

echo Installing Chromium
apt-get -y install chromium-browser

echo 'Installing PostgreSQL 10 and PostGIS'
${BOOT}/710-install-postgresql-10-and-postgis.bash

echo 'Installing Zoom'
${BOOT}/720-install-zoom.bash

echo 'Installing Slack'
${BOOT}/730-install-slack.bash

