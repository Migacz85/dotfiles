#!/bin/bash
while : 
do
  side=$(<side.conf)

  if [[ "$side" == "right" ]]; then
    import -window root -crop 950x1100+970+0 /srv/http/p.png
    if [[ $1 == "invert" ]]; then
    convert  /srv/http/p.png -channel RGB -negate /srv/http/p.png
    fi
    
    sleep 5
  fi
  if [[ "$side" == "left" ]]; then
    import -window root -crop 950x1100+0+0 /srv/http/p.png
    if [[ $1 == "invert" ]]; then
    convert  /srv/http/p.png -channel RGB -negate /srv/http/p.png
    fi
    sleep 5
  fi

done
