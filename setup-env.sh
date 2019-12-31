#!/bin/bash # Script for installation and setting fresh environment
# on manjaro
# Run symlinking.sh script  first
#First clone this
#git clone https://github.com/Migacz85/dotfiles.git --recurse-submodules


#sudo pacman-mirrors --fasttrack
sudo pacman -Syyu
git config --global user.email "migacz85@gmail.com" 
git config --global user.name "Marcin"

bash $HOME/dotfiles/.scripts/capsesc.sh
cd dotfiles/.package-list
cp $HOME/dotfiles/.package-list/my-manjaro-packages-Q.txt $HOME/dotfiles/.old-package-list/my-manjaro-packages-Q.txt
bash $HOME/dotfiles/symlinking.sh
bash $HOME/dotfiles/fixes.sh

sudo pacman -S yay
# yay compton-tryone-git
sudo pacman -S picom

mkdir $HOME/.wallpapers
cd $HOME/.wallpapers
curl --output 1.jpg https://wallroom.io/2560x1440/bg-381e88e/download
curl --output 2.jpg https://wallroom.io/2560x1440/bg-2efe366/download
curl --output 3.jpg http://i.imgur.com/5cYE4ui.png

#If you want to install AUR packages from file:
# for i in `cat my-manjaro-AUR-packages-Qm.txt` ; do yay -y install $i; done
sudo pacman -S binutils  --noconfirm
sudo pacman -S bat  --noconfirm
sudo pacman -S i3  
sudo pacman -S rofi  --noconfirm
sudo pacman -S pavucontrol  --noconfirm
sudo pacman -S ranger  --noconfirm
sudo pacman -S stow  --noconfirm
sudo pacman -S vim  --noconfirm
sudo pacman -S urxvt-unicode  --noconfirm
sudo pacman -S termite-nocsd  --noconfirm
sudo pacman -S termite  --noconfirm
sudo pacman -S feh  --noconfirm
sudo pacman -S cmake  --noconfirm
sudo pacman -S udiskie  --noconfirm
sudo pacman -S xsel   --noconfirm
sudo pacman -S ncdu  --noconfirm
sudo pacman -S bat  --noconfirm
sudo pacman -S python-pip  --noconfirm
sudo pacman -S notify-osd  --noconfirm
sudo pacman -S w3m  --noconfirm
sudo pacman -S mpv  --noconfirm
sudo pacman -S volume-icon  --noconfirm
sudo pacman -S network-manager-applet  --noconfirm
sudo pacman -S xorg-xwininfo --noconfirm
sudo pacman -S xorg-xbacklight --noconfirm
#APPS
sudo pacman -S thunar  --noconfirm
sudo pacman -S copyq  --noconfirm
sudo pacman -S emacs  --noconfirm
sudo pacman -S chromium 
sudo pacman -S thunderbird  
sudo pacman -S virtualbox
sudo pacman -S calibre
sudo pacman -S epr
yay qbittorrent-dark-git

# sudo pacman -S spectacle  

pip3 install --user mps-youtube
pip3 install --user youtube-dl
yay imgur-screenshot

#Bluetooth
sudo pacman -S bluetooth pulseaudio-bluetooth bluez-utils pulseaudio-alsa

#Cli torrents
#In console type: t name_of_file
sudo pip3 install pirate-get
mkdir $HOME/Downloads/torrents

#Ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
cd /.config/ranger/plugins/ranger_devicons
make
yay devicons
yay nerd-fonts-noto-sans-mono

#Imgur Screenshot
cd $HOME/Downloads/git
git clone https://github.com/jomo/imgur-screenshot.git
sudo pacman -S xclip scrot --noconfirm

#Pywall
echo "Installing pywal"
cd $HOME/dotfiles/submodules/pywal
pip3 install --user pywal
bash $HOME/dotfiles/.scripts/dwall.sh
bash $HOME/dotfiles/.scripts/wall.sh
wal -R
xrdb merge ~/.cache/wal/colors.Xresources
#Translation in shell
cd ~/Downloads/git
git clone https://github.com/soimort/translate-shell.git
make
make install
#Vim
echo "Vim installation"
sudo pacman -S vim
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
sudo pacman -S cmake
cd /home/migacz/.vim/plugged/YouCompleteMe
python3 install.py --clang-completer
python3 install.py --all
#Emacs
#Spacemacs
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo pacman -S npm
sudo npm install -g tern
