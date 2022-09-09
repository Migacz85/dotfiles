#!/usr/bin/env bash
#Toggling between light and dark mode

dir="~/.wallpapers/"

source functions_dark_mode.sh

function RestartApps {
  ExecFuncIfWmClassExist SetBrowser         Chromium 
  ExecFuncIfWmClassExist SetBrowser         Google-chrome 
  ExecFuncIfWmClassExist RestartTelegram    TelegramDesktop
  ExecFuncIfWmClassExist RestartQutebrowser qutebrowser
  ExecFuncIfWmClassExist RestartCode        code-oss
}

##Main function

   if [ $1 == 'light' ];then
   TermiteLight
   alacritty-colorscheme -c ~/.config/alacritty/alacritty.yml -C ~/.config/alacritty/alacritty-theme/themes/ -V toggle night_owlish_light.yaml  #pencil_light.yaml 

   FindMatchInFileAndWriteAfter 'config.set("colors.webpage.darkmode.enabled",' ' False)'     ~/.config/qutebrowser/config.py
   FindMatchInFileAndWriteAfter '--theme='  '"Coldark-Cold"'                                  ~/.config/bat/config
   FindMatchInFileAndWriteAfter 'gtk-application-prefer-dark-theme=' false                    ~/.config/gtk-3.0/settings.ini
   FindMatchInFileAndWriteAfter 'gtk-theme-name=' Adwaita                                     ~/.config/gtk-3.0/settings.ini
   FindMatchInFileAndWriteAfter 'name=' Air                                                   ~/.config/plasmarc
   FindMatchInFileAndWriteAfter 'theme=' __aurorae__svg__McMojave-light                       ~/.config/kwinrc 
   FindMatchInFileAndWriteAfter 'theme=' 'KvMojaveLight#'                                     ~/.config/Kvantum/kvantum.kvconfig
   # cp /home/migacz/.config/plasmaConfSaver/Light/kdeglobals                   ~/.config/kdeglobals

   fi

   if [ $1 == 'dark' ];then
   TermiteDark
   alacritty-colorscheme -c ~/.config/alacritty/alacritty.yml -C ~/.config/alacritty/alacritty-theme/themes/ -V toggle nord.yaml
    
   FindMatchInFileAndWriteAfter 'config.set("colors.webpage.darkmode.enabled",' ' True)'      ~/.config/qutebrowser/config.py
   FindMatchInFileAndWriteAfter '--theme='  '"Visual Studio Dark+"'                           ~/.config/bat/config
   FindMatchInFileAndWriteAfter 'gtk-application-prefer-dark-theme=' true                     ~/.config/gtk-3.0/settings.ini
   FindMatchInFileAndWriteAfter 'gtk-theme-name=' Adwaita-dark                                ~/.config/gtk-3.0/settings.ini
   FindMatchInFileAndWriteAfter 'name=' McMojave                                              ~/.config/plasmarc
   FindMatchInFileAndWriteAfter 'theme=' __aurorae__svg__McMojave                             ~/.config/kwinrc
   FindMatchInFileAndWriteAfter 'theme=' 'KvMojave#'                                          ~/.config/Kvantum/kvantum.kvconfig
   # cp /home/migacz/.config/plasmaConfSaver/Dark/kdeglobals                    ~/.config/kdeglobals
   fi

RestartApps
# qdbus org.kde.KWin /KWin reconfigure
# konsole -e kquitapp5 plasmashell && kstart5 plasmashell --windowclass plasmashell --window Desktop