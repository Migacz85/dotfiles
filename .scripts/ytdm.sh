#!/bin/bash
# Copy url link from browser and 
# Youtube Downlod Music
quality=1080
frames=30

sleep 1 &&
xdotool type yy  &&
cd ~/Music   &&
sleep 1 &&
clip=$(xsel --clipboard --output)  &&

if [[ $1 == 'music' ]]; then
    notify-send -a "Ytdm.sh" "downloading $clip from yt to /Music"
    # https://github.com/ytdl-org/youtube-dl#output-template%(date)s/%(upload_date)s
    yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 $clip -o '~/Music/%(title)s-%(id)s.%(ext)s' > ~/Music/yt.out

    out=$(cat yt.out) &&
    notify-send "$out"
    notify-send -a "Ytdm.sh" "Completed"

elif [[ $1 == 'video' ]]; then
    notify-send -a "Ytdm.sh" "downloading $clip from yt to /Videos"
    yt-dlp $clip -o '~/Videos/%(title)s-%(id)s.%(ext)s' > ~/Videos/yt.out

    out=$(cat yt.out) &&
    notify-send "$out"
    notify-send -a "Ytdm.sh" "Completed"

elif [[ $1 == 'mpv' ]]; then

    sleep 0.4
    xdotool key space
    mpv --ytdl-format="bestvideo[height<=?$quality][fps<=?$frames][vcodec!=?vp9]+bestaudio/best" $clip &
    sleep 5 &&
    i3-msg [class="Chromium"] focus && xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    xdotool key ctrl+d
    sleep 1
    xdotool key ctrl+d
    xdotool key ctrl+d

fi
