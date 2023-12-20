#!/usr/bin/bash

# Add packages wanted in bootstrap
ESSENTIALS=("base-devel btrfs-progs exfatprogs e2fsprogs pacman-contrib xorg-xinit i3-wm dunst man-db man-pages inetutils amd-ucode fd unzip xorg-xkill pango xclip")
ESSENTIALS2=("wget gawk wireplumber xorg-xev git pipewire rsync rclone pipewire-audio pipewire-pulse ripgrep playerctl gnome-keyring seahorse")
EXTRAS=("neovim firefox chromium rofi rustup meld aws-cli transmission-cli transmission-qt wezterm copyq otf-monaspace-nerd helvum bat spotifyd bottom htop")
EXTRAS2=("remmina feh krita gimp rawtherapee nemo xcolor xplr fzf lazygit github-cli hub jq gron bottom glances neofetch font-manager dust peco gradle")
EXTRAS3=("bitwarden-cli bitwarden polybar arandr autorandr yadm discord tealdeer hacksaw shotgun")
AUR=("slack-desktop usbimager android-studio i3lock-color spotify zoom pulseaudio-control zscroll-git postman-bin asdf-vm")

# Ask for sudo
if [ $EUID != 0 ]; then
	sudo "$0" "$@"
	exit $?
fi

# Get reflector first thing
pacman -Syu --noconfirm --needed reflector

# Setup our reflector config for the fastest downloads
echo "Backing up /etc/xdg/reflector/reflector.conf to reflector.conf.bak"
cp /etc/xdg/reflector/reflector.conf /etc/xdg/reflector/reflector.conf.bak

echo "Setting up /etc/xdg/reflector/reflector.conf"
sed --in-place 's/France,Germany/us/' /etc/xdg/reflector/reflector.conf
sed --in-place 's/^# --country/--country/' /etc/xdg/reflector/reflector.conf
sed --in-place 's/5/50/' /etc/xdg/reflector/reflector.conf
sed --in-place 's/time/rate/' /etc/xdg/reflector/reflector.conf

echo "Enabling reflector.timer"
systemctl enable reflector.timer
systemctl start reflector.timer

# Update pacman for 20 parallel downloads at a time
echo "Setting up /etc/pacman.conf"
sed --in-place 's/= 5/= 20/' /etc/pacman.conf
sed --in-place 's/#Parallel/Parallel/' /etc/pacman.conf

# Get the essentials
pacman -Syu --noconfirm --needed $ESSENTIALS $ESSENTIALS2

# All the noto fonts (for the unicode support)
pacman -S $(pacman -Ssq noto-fonts)

# Set pacman cache to clean up after itself weekly
echo "Enabling paccache.timer"
systemctl enable paccache.timer

# Setup rust toolchain
echo "Setting up rust toolchain to stable for this machine"
rustup toolchain install stable
rustup default stable

# Setup paru using $SUDO_USER (so permissions are ok)
echo "Cloning paru"
sudo -H -u $SUDO_USER bash -c 'git clone https://aur.archlinux.org/paru.git'
cd paru
sudo -H -u $SUDO_USER bash -c 'makepkg -si'
cd ..

# Install PARU list of packages because why not use both?
echo "Installing PARU defined and AUR packages (see this file to change list of packages installed)"
sudo -H -u $SUDO_USER bash -c "paru -S --noconfirm --nouseask --sudoloop --needed $EXTRAS $EXTRAS2 $EXTRAS3 $AUR"

# Setup polybar config in ~ (should this just be pulled via yadm?)
echo "Setting up ~/.config/polybar/config.ini file"
mkdir -p /home/$SUDO_USER/.config/polybar
cp /etc/polybar/config.ini /home/$SUDO_USER/.config/polybar

# Setup xinit
#cp /etc/X11/xinit/xinitrc /home/$SUDO_USER/.xinitrc

# Setup lightdm and lightdm-mini-greeter
# echo "Configuring lightdm and lightdm-mini-greeter"
# sed --in-place 's/#greeter-session/greeter-session/' /etc/lightdm/lightdm.conf
# sed --in-place 's/example-gtk-gnome/lightdm-mini-greeter/' /etc/lightdm/lightdm.conf
# sed --in-place "s/CHANGE_ME/$SUDO_USER/" /etc/lightdm/lightdm-mini-greeter.conf

# Setup change default shell to zsh
chsh -s $(which zsh) $SUDO_USER

# Install oh-my-zsh
sudo -H -u $SUDO_USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install lazyvim
mv /home/$SUDO_USER/config/nvim{,.bak}
mv /home/$SUDO_USER/.local/share/nvim{,.bak}
mv /home/$SUDO_USER/.local/state/nvim{,.bak}
mv /home/$SUDO_USER/.cache/nvim{,.bak}
sudo -H -u $SUDO_USER bash -c "$(git clone https://github.com/LazyVim/starter /home/$SUDO_USER/.config/nvim)"
rm -rf /home/$SUDO_USER/.config/nvim/.git
chown -fR cduong:cduong /home/$SUDO_USER/.config/nvim

# Setup pipewire
cp -r /usr/share/pipewire/ /home/$SUDO_USER/.config/pipewire
chown -fR cduong:cduong /home/$SUDO_USER/.config/pipewire
sudo -H -u $SUDO_USER bash -c "$(systemctl --user enable pipewire-pulse.service)"
sudo -H -u $SUDO_USER bash -c "$(systemctl --user enable wireplumber.service)"

# Setup spotifyd
sudo -H -u $SUDO_USER bash -c "$(systemctl --user enable spotify-d.service)"
# Setup playerctld
sudo -H -u $SUDO_USER bash -c "$(systemctl --user enable playerctld.service)"

# Get pritunl from official pritunl client repo
sudo tee -a /etc/pacman.conf <<EOF
[pritunl]
Server = https://repo.pritunl.com/stable/pacman
EOF

sudo pacman-key --keyserver hkp://keyserver.ubuntu.com -r 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo pacman-key --lsign-key 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo pacman -Sy
sudo pacman -S pritunl-client-electron
