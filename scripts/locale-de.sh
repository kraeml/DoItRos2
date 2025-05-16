#!/bin/bash -eux

# Update package lists for upgrades and new installations
apt-get update --yes >/dev/null

# Install language packs and applications
apt-get install --yes --quiet language-pack-de manpages-de language-pack-de-base hunspell-de-ch \
             wogerman hunspell-de-at hunspell-en-us wbritish hunspell-de-de language-pack-gnome-de wngerman \
             hunspell-en-au wswiss hunspell-en-za hunspell-en-ca wamerican hunspell-en-gb file-roller \
             gnome-terminal firefox  firefox-locale-de > /dev/null

# Set locale settings for messages and system language to German (Germany) with UTF-8 encoding
localectl set-locale LC_MESSAGES=de_DE.utf8 LANG=de_DE.UTF-8

# Update locale settings based on changes made with localectl
update-locale >/dev/null

# Set keyboard layout for X11 to German with PC105 layout, disable dead keys, and set compose key to right Windows key
localectl set-x11-keymap de pc105 nodeadkeys compose:rwin

# Update locale settings again to ensure all changes are applied
update-locale >/dev/null

# Set the system timezone to Berlin (Europe/Berlin)
timedatectl set-timezone Europe/Berlin

