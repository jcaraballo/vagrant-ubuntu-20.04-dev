#!/usr/bin/env bash

# I'm not sure I need the three of these
apt-get install -y \
    ibus-table-cantonese \
    ibus-table-jyutping \
    gnome-getting-started-docs-zh-hk

echo 'Add Cantonese Jyutping by the following:'
echo '* restart'
echo '* Language Support => Install/Remove Languages => select Chinese Traditional => Apply'
echo '* Language Support => Install/Remove Languages => select Chinese Simplified => Apply'
echo '* restart'
echo '* Language and Region => + => Chinese (Hong Kong) => Chinese (Jyutping) => Add'

# Some of these packages might automate part of the above
#* firefox-locale-zh-hant				install
#* fonts-arphic-ukai				install
#* fonts-arphic-uming				install
#* fonts-noto-cjk-extra				install
#* gnome-getting-started-docs-zh-tw		install
#* ibus-chewing					install
#* ibus-table-cangjie3				install
#* ibus-table-cangjie5				install
#* ibus-table-quick-classic			install
#* language-pack-gnome-zh-hant			install
#* language-pack-gnome-zh-hant-base		install
#* language-pack-zh-hant				install
#* language-pack-zh-hant-base			install
#* libchewing3:amd64				install
#* libchewing3-data				install
#* libgail-common:amd64				install
#* libgail18:amd64					install
#* libgtk2.0-0:amd64				install
#* libgtk2.0-bin					install
#* libgtk2.0-common				install
#* firefox-locale-zh-hans				install
#* gnome-user-docs-zh-hans				install
#* ibus-libpinyin					install
#* ibus-table-wubi					install
#* language-pack-gnome-zh-hans			install
#* language-pack-gnome-zh-hans-base		install
#* language-pack-zh-hans				install
#* language-pack-zh-hans-base			install
#* libpinyin-data:amd64				install
#* libpinyin13:amd64				install

