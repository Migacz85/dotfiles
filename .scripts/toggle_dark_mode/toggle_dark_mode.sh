#Toggling between light and dark mode
#
dir="/home/migacz/.wallpapers/"

function  set_chrome {
  #Restart chromium and set dark
  wmctrl -a chromium && xdotool key Alt_L+d && xdotool type "chrome:restart" && xdotool key Return
  sleep 2
  wmctrl -a chromium && xdotool key Alt_L+Shift_L+d
  wmctrl -a chromium && xdotool key Alt_L+r
}

function set_gtk {
  sed -i "s/\(gtk-theme-name=\)\(.*\)/\1$1/" ~/.config/gtk-3.0/settings.ini
}

# 1 find 2 write 3 path
function find_and_write {
  sed -i "s/\($1\)\(.*\)/\1$2/" $3 
}


function restart_apps {
  set_chrome &&
  pkill telegram
  telegram-desktop &
}


#Main function
   if [ $1 == 'light' ];then

   find_and_write 'gtk-application-prefer-dark-theme=' false           ~/.config/gtk-3.0/settings.ini
   find_and_write 'gtk-theme-name=' Adwaita                            ~/.config/gtk-3.0/settings.ini
   find_and_write 'name=' Air                                          ~/.config/plasmarc
   find_and_write 'theme=' __aurorae__svg__McMojave-light              ~/.config/kwinrc 
   find_and_write 'theme=' 'KvMojaveLight#'                            ~/.config/Kvantum/kvantum.kvconfig
   # cp /home/migacz/.config/plasmaConfSaver/Light/kdeglobals            ~/.config/kdeglobals

   # wal -i "$dir" -l  --saturate 0.9 -a 60 -n -e -b '#ffffff'
   fi

   if [ $1 == 'dark' ];then
   find_and_write 'gtk-application-prefer-dark-theme=' true            ~/.config/gtk-3.0/settings.ini
   find_and_write 'gtk-theme-name=' Adwaita-dark                       ~/.config/gtk-3.0/settings.ini
   find_and_write 'name=' McMojave                                     ~/.config/plasmarc
   find_and_write 'theme=' __aurorae__svg__McMojave                    ~/.config/kwinrc
   find_and_write 'theme=' 'KvMojave#'                                 ~/.config/Kvantum/kvantum.kvconfig
   # cp /home/migacz/.config/plasmaConfSaver/Dark/kdeglobals             ~/.config/kdeglobals

   # wal -i "$dir"  --saturate 0.5 -n -e -b '#191919'

   # application style
   fi

restart_apps
# qdbus org.kde.KWin /KWin reconfigure
# konsole -e kquitapp5 plasmashell && kstart5 plasmashell --windowclass plasmashell --window Desktop
