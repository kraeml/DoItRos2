#!/bin/bash -eux

#ToDo Zeitzone fehlt noch
apt-get update --yes >/dev/null
apt-get install --yes --quiet language-pack-de manpages-de language-pack-de-base hunspell-de-ch \
             wogerman hunspell-de-at hunspell-en-us wbritish hunspell-de-de language-pack-gnome-de wngerman \
             hunspell-en-au wswiss hunspell-en-za hunspell-en-ca wamerican hunspell-en-gb file-roller \
             gnome-terminal firefox  firefox-locale-de > /dev/null

localectl set-locale LC_MESSAGES=de_DE.utf8 LANG=de_DE.UTF-8
update-locale >/dev/null
localectl set-x11-keymap de pc105 nodeadkeys compose:rwin
update-locale >/dev/null
timedatectl set-timezone Europe/Berlin 
