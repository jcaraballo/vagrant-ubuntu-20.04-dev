#!/usr/bin/env bash

VH=/home/vagrant
BOOT=/vagrant/boot
RESOURCES=/vagrant/resources

IDEA_URL='https://download-cf.jetbrains.com/idea/ideaIU-2019.3.2.tar.gz'
WEBSTORM_URL='https://download-cf.jetbrains.com/webstorm/WebStorm-2018.1.2.tar.gz'
JDK_TAR_PATH=$( ${BOOT}/path_of_single_file_in_dir.bash ${RESOURCES}/jdk )

DOCKER_COMPOSER_VERSION=1.24.0
DOCKER_MACHINE_VERSION=0.16.0

function heading(){
  echo ---------------------------- >&2
  echo $* >&2
  echo ---------------------------- >&2
}

export DEBIAN_FRONTEND=noninteractive

${BOOT}/010-install-sbt-step-1-add-apt-sources.bash

heading Updating apt sources
until apt-get update ; do echo retrying updating apt sources... ; done

heading Updating packages
until apt-get -y upgrade ; do echo retrying updating packages... ; done

heading 'ssh keys set up'
sudo -Hu vagrant ${BOOT}/101-maybe-set-up-ssh-keys.bash ${RESOURCES}/ssh-keys
heading 'known_hosts set up'
sudo -Hu vagrant ${BOOT}/102-set-up-known_hosts.bash github.com bitbucket.org

heading Installing curl
${BOOT}/210-install-curl.bash
heading Installing sbt
${BOOT}/220-install-sbt-step-2-apt-get-install.bash
heading Installing tree
${BOOT}/230-install-tree.bash
heading Installing gitk
${BOOT}/240-install-gitk.bash
heading Setting up git
sudo -Hu vagrant ${BOOT}/241-set-up-git.bash ${RESOURCES}/git/email ${RESOURCES}/git/name
${BOOT}/245-as-root-install-tig.bash

heading Installing Chromium
${BOOT}/250-as-root-install-chromium.bash

heading "Installing java from $JDK_TAR_PATH"
${BOOT}/301-install-java.bash "$JDK_TAR_PATH"

heading Installing IntelliJ Idea
sudo -Hu vagrant ${BOOT}/410-install-idea-step-1-install.bash "$IDEA_URL" "${VH}/tools"
${BOOT}/411-install-idea-step-2-increase-fs-user-watches.bash
sudo -Hu vagrant ${BOOT}/412-maybe-copy-idea-config.bash ${RESOURCES}/idea-config "${VH}"

#heading Installing WebStorm
#sudo -Hu vagrant ${BOOT}/420-install-webstorm.bash "$WEBSTORM_URL" "${VH}/tools"

heading Installing Node
${BOOT}/510-install-node-all-users.bash

heading Installing yarn
${BOOT}/520-as-root-install-yarn.bash
sudo -Hu vagrant ${BOOT}/521-as-vagrant-add-yarn-to-path.bash

heading Installing elm
sudo -Hu vagrant ${BOOT}/530-install-elm.bash

heading 'Installing heroku cli'
${BOOT}/620-install-heroku-cli.bash

heading 'Installing Docker Rootless'
${BOOT}/705-as-root-install-docker-rootless-dependency-uidmap.bash
sudo -Hu vagrant ${BOOT}/706-as-vagrant-install-docker-rootless.bash

heading 'Installing PostgreSQL 10 and PostGIS'
${BOOT}/710-install-postgresql-10-and-postgis.bash

heading 'Installing Slack'
${BOOT}/730-install-slack.bash

heading 'Installing mbpoll (cli client to talk to a ModBus slave)'
${BOOT}/740-as-root-install-mbpoll.bash

heading 'Installing aws cli'
${BOOT}/750-as-root-install-awscli.bash

heading 'Installing Chinese Hong Kong Cantonese Jyutping input support'
${BOOT}/810-as-root-install-chinese-hongkong-jyutping-input.bash

