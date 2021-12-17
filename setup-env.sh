#!/bin/bash # Script for installation and setting fresh environment
# on manjaro
# Run symlinking.sh script  first
#First clone this
#git clone https://github.com/Migacz85/dotfiles.git --recurse-submodules


#Configure mirrors
sudo pacman-mirrors --fasttrack

#Upgrade system
yes | sudo pacman -Syyu

#Git config
git config --global user.email "migacz85@gmail.com" 
git config --global user.name "Marcin"
git config --global user.name "Type_Password_before"

#Symlinking dotfiles with dotfiles folder
bash $HOME/dotfiles/.scripts/capsesc.sh
cd dotfiles/.package-list
cp $HOME/dotfiles/.package-list/my-manjaro-packages-Q.txt $HOME/dotfiles/.old-package-list/my-manjaro-packages-Q.txt
bash $HOME/dotfiles/symlinking.sh

read -p "Extend .bashrc with loading a .bash_profile? (run this only once)" yn
    case $yn in
        [Yy]* ) bash $HOME/dotfiles/fixes.sh; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac

#AUR support
yes | sudo pacman -S base-devel
yes | sudo pacman -S yay

#Compositor
# sudo pacman -S picom
yay picom-ibhagwan-git

#Wallpapers
mkdir $HOME/.wallpapers
cd $HOME/.wallpapers
curl --output 1.jpg https://wallroom.io/2560x1440/bg-381e88e/download
curl --output 2.jpg https://forums.tumult.com/uploads/db2156/original/3X/2/6/264395883921d9ac5c74d5f5b841b00c2c7b130e.jpeg
curl --output 3.jpg https://wallroom.io/2560x1440/bg-2efe366/download

#Cursor Installation
yes | pacman -S capitaine-cursors
cd ~Downloads/
sudo cp -r /usr/share/icons/capitaine-cursors/ /.icons/


#If you want to install AUR packages from file:
# for i in `cat my-manjaro-AUR-packages-Qm.txt` ; do yay -y install $i; done
yes | sudo pacman -S binutils  --noconfirm
yes | sudo pacman -S bat  --noconfirm
yes | sudo pacman -S i3-gaps --noconfirm
yes | sudo pacman -S i3status --noconfirm
yes | sudo pacman -S rofi  --noconfirm
yes | sudo pacman -S pavucontrol  --noconfirm
yes | sudo pacman -S volumeicon  --noconfirm
yes | sudo pacman -S ranger  --noconfirm
yes | sudo pacman -S unp  --noconfirm
yes | sudo pacman -S unzip  --noconfirm
yes | sudo pacman -S fzf  --noconfirm
yes | sudo pacman -S stow  --noconfirm
yes | sudo pacman -S vim  --noconfirm
yes | sudo pacman -S urxvt-unicode  --noconfirm
yes | sudo pacman -S termite-nocsd  --noconfirm
yes | sudo pacman -S termite  --noconfirm
yes | sudo pacman -S feh  --noconfirm
yes | sudo pacman -S cmake  --noconfirm
yes | sudo pacman -S udiskie  --noconfirm
yes | sudo pacman -S xsel   --noconfirm
yes | sudo pacman -S ncdu  --noconfirm
yes | sudo pacman -S bat  --noconfirm
yes | sudo pacman -S python-pip  --noconfirm
yes | sudo pacman -S npm --noconfirm
yes | sudo pacman -S ruby --noconfirm
yes | sudo pacman -S dunst  --noconfirm
yes | sudo pacman -S w3m  --noconfirm
yes | sudo pacman -S mpv  --noconfirm
yes | sudo pacman -S network-manager-applet  --noconfirm
yes | sudo pacman -S xorg-xwininfo --noconfirm
yes | sudo pacman -S xorg-xbacklight --noconfirm
yes | sudo pacman -S xdotool --noconfirm

#For autorotation on convertible laptops
# sudo pacman -S xorg-xinput
# yay  iio-sensor-proxy
#Emoticons
yay emojione-picker-git  

sudo pip3 install i3ipc --noconfirm
#APPS
yes | sudo pacman -S thunar  --noconfirm
yes | sudo pacman -S copyq  --noconfirm
yes | sudo pacman -S emacs  --noconfirm
yes | sudo pacman -S chromium  --noconfirm
yes | sudo pacman -S thunderbird   --noconfirm
yes | sudo pacman -S virtualbox --noconfirm
yes | sudo pacman -S calibre --noconfirm
yes | sudo pacman -S epr --noconfirm
yay qbittorrent-dark-git
yay telegram-desktop

# Controlling brightness
yay brillo 

# sudo pacman -S spectacle  
yay straw-viewer
pip3 install --user youtube-dl
yay imgur-screenshot

#Mail
# https://wiki.archlinux.org/index.php/Msmtp
#
yay msmtp
chmod 600 ~/.msmtprc

#Bluetooth
sudo pacman -S bluetooth pulseaudio-bluetooth bluez-utils pulseaudio-alsa

#Cli torrents
#In console type: t name_of_file
yes | sudo pip3 install pirate-get
mkdir $HOME/Downloads/torrents

#qutebrowser
yes | sudo pacman -S qutebrowser --noconfirm
mkdir ~/Downloads/git/
cd ~/Downloads/git/
git clone https://github.com/alphapapa/solarized-everything-css.git


#Ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
cd /.config/ranger/plugins/ranger_devicons
make
yay devicons
yay nerd-fonts-noto-sans-mono
mkdir ~/Android
mkdir ~/Trash
mkdir $HOME/log
yes | sudo pacman -S sshfs --noconfirm
yes | sudo pacman -S ssmtp # for mail you need to run fixes.sh aswell
yes | sudo pacman -S sxiv

#Imgur Screenshot
cd $HOME/Downloads/git
git clone https://github.com/jomo/imgur-screenshot.git
yes | sudo pacman -S xclip scrot --noconfirm

#Deepin screenshot
wget https://gist.github.com/msenol86/c0c7daad3de32a7922486e5d669f24c6/archive/82abb9ad54f13c8e53d6272e0d0a999498ffa204.zip
unp 82abb9ad54f13c8e53d6272e0d0a999498ffa204.zip
cd c0c7daad3de32a7922486e5d669f24c6-82abb9ad54f13c8e53d6272e0d0a999498ffa204
makepkg -si PKGBUILD
rm 82abb9ad54f13c8e53d6272e0d0a999498ffa204.zip 
rm -r c0c7daad3de32a7922486e5d669f24c6-82abb9ad54f13c8e53d6272e0d0a999498ffa204

#Pywall
echo "Installing pywal"
cd $HOME/dotfiles/submodules/pywal
pip3 install --user pywal
bash $HOME/dotfiles/.scripts/dwall.sh
bash $HOME/dotfiles/.scripts/wall.sh
wal -R
xrdb merge ~/.cache/wal/colors.Xresources

bash /home/$USER/.scripts/dwall.sh
#Translation in shell
yay translate-shell

#Editor
#Vim
echo "Vim installation"
yes | sudo pacman -S vim
yes | sudo pacman -S cmake
cd ~
git clone https://github.com/Migacz85/vim-config.git
mv vim-config .vim
ln -s ~/.vim/.vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.vim/undo
echo "Run :PlugInstall inside vim (in 5sec vim will start)"
sleep 5
vim

# python3 /home/$USER/.vim/plugged/YouCompleteMe/install.py
# python3 /home/$USER/.vim/plugged/YouCompleteMe/install.py --clang-completer
python3 /home/$USER/.vim/plugged/YouCompleteMe/install.py --all
sudo npm install js-beautify -g
#You need to run this command manually after installation
cd ~/.vim/plugged/command-t/ruby/command-t/ext/command-t && make clean; ruby extconf.rb && make

#Doom emacs
sudo npm install -g tern
sudo pacman --needed --noconfirm -S ripgrep
yay prettier mu mbsync-git
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

#mail in doom
mkdir -p ~/Maildir/gmail/
mkdir -p ~/Maildir/gmail/INBOX
time mu init --maildir=~/Maildir --my-address='migacz85@gmail.com'
time mbsync -c ~/.config/mu4e/mbsyncrc -a


# Fixes for Legion 5p amd 7 4800h with rtx2060
sudo su
rmmod pcspkr ; echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf

#Create service with script that is running as root
cd /etc/systemd/system
sudo cat >~/etc/ssmtp/run-at-startup.service <<EOL
[Unit]
Description=Run script at startup after all systemd services are loaded
After=getty.target
[Service]
Type=simple
RemainAfterExit=yes
ExecStart=/home/migacz/.scripts/startup.sh
TimeoutStartSec=0
[Install]
WantedBy=default.target
EOL

systemctl enable run-at-startup.service
