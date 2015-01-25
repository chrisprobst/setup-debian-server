#!/bin/sh

# Ensure this script is run as root
if [ "$(id -u)" != "0" ]; then
    echo "#\tThis script must be run as root." 1>&2
    exit 1
fi

# Install important programs
apt-get update
apt-get install zsh git nano curl htop build-essential mercurial bison rsync grep telnet apache2 screen tmux


if id -u kr0e >/dev/null 2>&1; then
        echo "User kr0e already registered, skipping..."
else
        # Create kr0e user account
        printf "\n${bold}Creating kr0e user account${normal}\n"
        useradd -m -d /home/kr0e -s /bin/zsh kr0e

        # Set kr0e account password
        printf "\n${bold}Creating kr0e user account password${normal}\n"
        passwd kr0e

        # Make sudo
        usermod -a -G sudo kr0e
fi

# Login as kr0e & install ohmyzsh
echo "# Auto-generated" > /home/kr0e/.zshrc
chown kr0e:kr0e /home/kr0e/.zshrc
su - kr0e -c "cd /home/kr0e; rm .zshrc; curl -L http://install.ohmyz.sh | sh;"
