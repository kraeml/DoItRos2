#!/bin/bash -eux

# Function to handle errors
handle_error() {
    echo "An error occurred at line $1. Exiting."
    exit 1
}

# Trap any errors
trap 'handle_error $LINENO' ERR

# Update package lists for upgrades and new installations
echo "Updating package lists..."
if ! apt-get update --yes >/dev/null; then
    echo "Failed to update package lists."
    exit 1
fi

# Define packages to install
PACKAGES=(
    language-pack-de manpages-de language-pack-de-base hunspell-de-ch
    wogerman hunspell-de-at hunspell-en-us wbritish hunspell-de-de
    language-pack-gnome-de wngerman hunspell-en-au wswiss hunspell-en-za
    hunspell-en-ca wamerican hunspell-en-gb file-roller gnome-terminal
    firefox firefox-locale-de
)

# Install language packs and applications
echo "Installing packages..."
if ! apt-get install --yes --quiet "${PACKAGES[@]}" >/dev/null; then
    echo "Failed to install packages."
    exit 1
fi

# Set locale settings for messages and system language to German (Germany) with UTF-8 encoding
echo "Setting locale settings..."
if ! localectl set-locale LC_MESSAGES=de_DE.utf8 LANG=de_DE.UTF-8; then
    echo "Failed to set locale settings."
    exit 1
fi

# Update locale settings based on changes made with localectl
echo "Updating locale settings..."
if ! update-locale >/dev/null; then
    echo "Failed to update locale settings."
    exit 1
fi

# Set keyboard layout for X11 to German with PC105 layout, disable dead keys, and set compose key to right Windows key
echo "Setting keyboard layout..."
if ! localectl set-x11-keymap de pc105 nodeadkeys compose:rwin; then
    echo "Failed to set keyboard layout."
    exit 1
fi

# Update locale settings again to ensure all changes are applied
echo "Updating locale settings again..."
if ! update-locale >/dev/null; then
    echo "Failed to update locale settings again."
    exit 1
fi

# Set the system timezone to Berlin (Europe/Berlin)
echo "Setting timezone..."
if ! timedatectl set-timezone Europe/Berlin; then
    echo "Failed to set timezone."
    exit 1
fi

echo "Script completed successfully."
