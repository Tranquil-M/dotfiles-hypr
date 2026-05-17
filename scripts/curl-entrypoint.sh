#!/usr/bin/env bash

clear
echo "Checking OS type..."
if ! command -v pacman &> /dev/null; then
	echo "Sorry, this script is only available on Arch Linux Distributions."
	exit 1
fi
echo "Arch Linux Detected"

echo ""

echo "Checking for git"
if ! command -v git &> /dev/null; then
	echo "Git not found, installing..."
	sudo pacman -Sy git --needed --no-confirm
fi
echo "Git found"

echo ""

echo "Cloning dotfiles repository"
echo ""
echo "Would you like to clone this repository using HTTPS or SSH?"
echo "1. HTTPS"
echo "2. SSH"
read -p "Enter 1 or 2: " response

echo ""

if [ $response == 1 ]; then
	echo "Cloning into ~/.dots using the HTTPS protocol"
	git clone https://Tranquil-M/dots ~/.dots
elif [ $response == 2 ]; then
	echo "Cloning into ~/.dots using the SSH protocol"
	git clone git@github.com:Tranquil-M/dots ~/.dots
else
	echo "Invalid index, closing..."
	exit 1
fi

cd ~/.dots

echo "Starting install script"
sh install.sh
