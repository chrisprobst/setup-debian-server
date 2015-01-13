#!/bin/sh

# Ensure this script is run as root
if [ "$(id -u)" != "0" ]; then
    echo "#\tThis script must be run as root." 1>&2
    exit 1
fi


if id -u matt >/dev/null 2>&1; then
        echo "User matt already registered, skipping..."
else
        # Create matt user account
        printf "\n${bold}Creating matt user account${normal}\n"
        useradd -m -d /home/matt -s /bin/zsh matt

        # Set matt account password
        printf "\n${bold}Creating matt user account password${normal}\n"
        passwd matt

        # Make sudo
        usermod -a -G sudo matt
fi

# Login as matt & install ohmyzsh
echo "# Auto-generated" > /home/matt/.zshrc
chown matt:matt /home/matt/.zshrc
su - matt -c "cd /home/matt; rm .zshrc; curl -L http://install.ohmyz.sh | sh;"
