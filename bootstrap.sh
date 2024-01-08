#!/usr/bin/bash

# Add packages wanted in bootstrap
ESSENTIALS1=("base-devel btrfs-progs exfatprogs e2fsprogs pacman-contrib xorg-xinit i3-wm dunst man-db man-pages inetutils fd unzip xorg-xkill pango xclip")
ESSENTIALS2=("wget gawk wireplumber xorg-xev git pipewire rsync rclone pipewire-audio pipewire-pulse ripgrep playerctl gnome-keyring seahorse noto-fonts zsh")
EXTRAS1=("neovim firefox chromium rofi rustup meld aws-cli transmission-cli transmission-qt wezterm copyq otf-monaspace-nerd helvum bat bottom htop")
EXTRAS2=("remmina feh krita gimp rawtherapee nemo xcolor xplr fzf lazygit github-cli hub jq gron bottom glances neofetch font-manager dust peco gradle")
EXTRAS3=("bitwarden-cli bitwarden polybar arandr autorandr yadm discord tealdeer hacksaw shotgun papirus-icon-theme rsync figlet ttf-hanazono")
EXTRAS4=("ncurses xorg-xsetroot xorg-xwininfo httpie flowblade obs-studio rofi-emoji")
AUR1=("slack-desktop usbimager android-studio spotify zoom pulseaudio-control zscroll-git postman-bin neo-matrix compfy")
AUR2=("rtx starship-git wakeonlan ncspot-bin xplorer-bin bitwarden-rofi")

ESSENTIALS="$ESSENTIALS1 $ESSENTIALS2"
EXTRAS="$EXTRAS1 $EXTRAS2 $EXTRAS3 $EXTRAS4"
AUR="$AUR1 $AUR2"

touch .secrets.sh

# Ask for sudo
if [ $EUID != 0 ]; then
	sudo "$0" "$@"
	exit $?
fi

# Update pacman for 20 parallel downloads at a time
echo "Setting up /etc/pacman.conf"
sed --in-place 's/= 5/= 20/' /etc/pacman.conf
sed --in-place 's/#Parallel/Parallel/' /etc/pacman.conf

# Get reflector first thing
pacman -Syu --noconfirm --needed reflector

# Setup our reflector config for the fastest downloads
echo "Backing up /etc/xdg/reflector/reflector.conf to reflector.conf.bak"
cp /etc/xdg/reflector/reflector.conf /etc/xdg/reflector/reflector.conf.bak

echo "Setting up /etc/xdg/reflector/reflector.conf"
sed --in-place 's/France,Germany/us/' /etc/xdg/reflector/reflector.conf
sed --in-place 's/^# --country/--country/' /etc/xdg/reflector/reflector.conf
sed --in-place 's/5/10/' /etc/xdg/reflector/reflector.conf
sed --in-place 's/time/rate/' /etc/xdg/reflector/reflector.conf

echo "Enabling reflector.timer"
systemctl enable reflector.timer
systemctl start reflector.timer

echo "Starting reflector now"
systemctl start reflector.service

# Setup rust toolchain
echo "Setting up rust toolchain to stable for this machine"
# sudo -H -u $SUDO_USER bash -c 'rustup toolchain install stable'
sudo -H -u $SUDO_USER bash -c 'rustup default stable'

# Get the essentials
pacman -Syu --noconfirm --needed $ESSENTIALS $EXTRAS

# Set pacman cache to clean up after itself weekly
echo "Enabling paccache.timer"
systemctl enable paccache.timer

# Setup paru using $SUDO_USER (so permissions are ok)
which paru
if [ $? -eq 1 ]; then
	echo "Cloning paru"
	sudo -H -u $SUDO_USER bash -c 'git clone https://aur.archlinux.org/paru.git'
	cd paru
	sudo -H -u $SUDO_USER bash -c 'makepkg -si'
	cd ..
fi

echo "Installing AUR packages"
sudo -H -u $SUDO_USER bash -c "paru -S --nouseask --skipreview --sudoloop --needed $AUR"

# Setup pipewire
cp -r /usr/share/pipewire/ /home/$SUDO_USER/.config/pipewire
chown -fR cduong:cduong /home/$SUDO_USER/.config/pipewire
sudo -H -u $SUDO_USER bash -c "$(systemctl --user enable pipewire-pulse.service)"
sudo -H -u $SUDO_USER bash -c "$(systemctl --user enable wireplumber.service)"

# Setup playerctld
sudo -H -u $SUDO_USER bash -c "$(systemctl --user enable playerctld.service)"

# Conditionally Get pritunl from official pritunl client repo
# sudo tee -a /etc/pacman.conf <<EOF
# [pritunl]
# Server = https://repo.pritunl.com/stable/pacman
# EOF
#
# sudo pacman-key --keyserver hkp://keyserver.ubuntu.com -r 7568D9BB55FF9E5287D586017AE645C0CF8E292A
# sudo pacman-key --lsign-key 7568D9BB55FF9E5287D586017AE645C0CF8E292A
# sudo pacman -Sy
# sudo pacman -S pritunl-client-electron

# Setup keyboard mnt point
mkdir /mnt/nano

# Make a symlink to neo-matrix since the AUR build script/makefile(?) doesn't do this
ln -s /usr/bin/neo-matrix /usr/bin/neo

# due to how oh-my-zsh installs it changes and drops us into a new shell when it does.
# We need to install it last because of this.
# Install oh-my-zsh
sudo -H -u $SUDO_USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
