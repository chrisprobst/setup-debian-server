#!/bin/sh

# Ensure this script is run as root
if [ "$(id -u)" != "0" ]; then
    echo "#\tThis script must be run as root." 1>&2
    exit 1
fi

# Install important programs
apt-get update
apt-get install zsh git nano curl htop build-essential


if id -u kr0e >/dev/null 2>&1; then
	echo "User kr0e already registered, skipping..."
else
	# Create kr0e user account
	printf "\n${bold}Creating kr0e user account${normal}\n"
	useradd -m -d /home/kr0e -s /bin/zsh kr0e
	

	# Set kr0e account password
	printf "\n${bold}Creating kr0e user account password${normal}\n"
	passwd kr0e
fi

# Login as kr0e & install ohmyzsh
su -c "cd; curl -L http://install.ohmyz.sh | sh" -m kr0e