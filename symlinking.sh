#!/bin/bash
#Run this script only from original place. 
#Remmember that if you want to symlink you need to firstly delete or rename
#original file

dotfilesDir=$(pwd)
dest="${HOME}"
  
function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M) 
  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${2}"
    rm ${2} 

  elif [ -f "${2}" ]; then
    # Existing file
    echo "Backing up existing file: ${2}"
    mv ${2}{,.${dateStr}}

  elif [ -d "${2}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${2}"
    mv ${2}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${2}"
  ln -s ${dotfilesDir}/${1} ${2}
} 

mv ~/.bash_profile ~/.bash_profile-${dateStr}
mv ~/.profile ~/.profile-${dateStr}

for f in $dotfilesDir .[^.]* ; do
  if [ $f != ".config" ] && [ $f != ".git" ] && [ $f != ".submodules" ] && [ $f != ".gitignore" ] && [ $f != ".gitmodules" ]; then
   ln -s $PWD/$f $HOME/
  fi
done

for f in $HOME/dotfiles/.config/* ; do
   echo "$f"
   ln -s $f $HOME/.config/
done

