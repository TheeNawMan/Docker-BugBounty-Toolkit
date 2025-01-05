#!/bin/bash
## Install script for my various docker containers that have a base image of kali-rolling.
## Maintained by theenawman "J3"

echo "Instalizing Base"
apt update 
apt -y --no-install-recommends upgrade
apt install -y --no-install-recommends nmap sudo build-essential tmux gcc iputils-ping git vim wget awscli tzdata curl make nmap whois python3 python3-pip perl nikto dnsutils net-tools zsh nano rename jq openvpn unzip
apt install -y --no-install-recommends golang gobuster feroxbuster ffuf nmap

echo "Creating Base User"
useradd -m -s /bin/bash bounty
echo "bounty:bounty" | chpasswd
echo "User bounty has been create with the password bounty"
usermod -aG sudo bounty

echo "Installing Go Tools"
go install github.com/tomnomnom/httprobe@latest &>/dev/null
go install github.com/tomnomnom/unfurl@latest &>/dev/null
go install github.com/tomnomnom/waybackurls@latest &>/dev/null

mv /root/go/bin/* /usr/sbin

echo "Installing PIA into openvpn directory"
cd /etc/openvpn
wget https://www.privateinternetaccess.com/openvpn/openvpn.zip
unzip openvpn.zip
