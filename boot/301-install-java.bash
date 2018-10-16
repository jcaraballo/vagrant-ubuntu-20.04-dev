#!/usr/bin/env bash

src=$1
target=/usr/lib/jvm

echo Installing Java
tmp=`mktemp -d`
tar xf ${src} -C ${tmp}
version=`ls ${tmp}`
echo ... Installing Java version ${version}
mkdir -p ${target}
mv -i "${tmp}/${version}" "${target}"
chown --recursive root:root "${target}/${version}"
update-alternatives --install /usr/bin/java java ${target}/${version}/bin/java 2000
update-alternatives --install /usr/bin/javac javac ${target}/${version}/bin/javac 2000
update-alternatives --install /usr/bin/javaws javaws ${target}/${version}/bin/javaws 2000
update-alternatives --install /usr/bin/keytool keytool ${target}/${version}/bin/keytool 2000
