#!/usr/bin/env bash
running_test="$( ps -efww | grep '[/]sync-phone.sh' )"
if [[ ! -z $running_test ]]; then

    connected=0
    #Script is running till sync is done
    bash kill_rsync.sh &
    while [ 1 ]
    do
        #Trying to catch connection with phone
        while [[ $connected == 0 ]];
        do
            killall sshfs -9
            fusermount -uz ~/Android
            echo "kontrakt" | sshfs s10@192.168.0.143:/ ~/Android -p 2222 -o password_stdin
            # echo "kontrakt" | sshfs migacz@192.168.0.145:/ ~/Android -p 2222 -o password_stdin
            sleep 3
            if [ "$?" = "0" ] ; then
                echo "Connected with phone, starting sync"
                notify-send "Connected with phone, starting sync"
                connected=1
            else
                notify-send "Could not connect to your phone" "Start your ssh server on your phone. Next try in 60 sec"
                echo "Sync data with phone failed"
                sleep 60
                connected=0
            fi
        done
        #Syncing files
        #With --delete If something deleted from camera it will be deleted in laptop aswell. Without - backup everything from phone
        rsync -auP --timeout=30 --delete --info=progress2 /home/migacz/Android/DCIM/Camera/ /home/migacz/Media/Phone > ~/sync.log

        # If something deleted on laptop - Delete on Phone aswell
        # rsync -auP --timeout=30 --delete --info=progress2 /home/migacz/Media/Phone/ /home/migacz/Android/DCIM/Camera > ~/sync.log

        #With --delete If something deleted from laptop it will be deleted phone aswell.
        # rsync -auP --timeout=30 --info=progress2 --delete /home/migacz/Media/Books-Audio/ /home/migacz/Android/#Docs/audiobooks > ~/sync.log

        #Sync in both ways:
        # unison /home/migacz/Not /home/migacz/Android/#Docs/Not -perms 0 -batch

        if [ "$?" = "0" ] ; then
            notify-send "Your laptop is synced with phone"
            echo "Your laptop is synced with phone"
            killall sshfs -9
            exit
        else
            connected=0
            notify-send "Sync data failed, turn on ssh on your phone. Trying again in 60 sec"
            echo "Sync data with phone failed"
            killall sshfs -9
            sleep 60
        fi
    done
else
    notify-send "Sync script already running"
fi
