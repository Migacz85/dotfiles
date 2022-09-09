DivideIfBigger()  {
    if [[ $1 > 1   ]]; then
    # echo -n $(( $1/$2 ))
    bc -l <<< "scale=0; $1/$2"
    else
    echo -n  $1
    fi
}


DecimalToHex () {
    hex=({{0..9},{A..F}})

    #08 and 09 will error in conversion from decimal to hex using this method so...
    if [[ $1 == 08 ]]; then
    var=$(DivideIfBigger 8 $2)
    echo -n "$var"
    fi

    if [[ $1 == 09 ]];then
    var=$(DivideIfBigger 9 $2)
    echo -n "$var"
    fi

    if [[ $1 != 09 && $1 != 08 ]];then
    var=$(DivideIfBigger $1 $2)
    echo -n ${hex[$var]}
    fi


}


hour=$(date '+%H')
minute=$(date '+%M')
second=$(date '+%S')

#Check how your clock will look like at specified time:
# hour=20
# minute=20
# second=10

if [[ $hour < 6 ]]; then
echo $(date '+%Y-%m-%d %H:%M:%S')
echo 
echo -n "#"
DecimalToHex $(($hour+14)) 1.5   #24 minutes divided by 2  = 12 (ideally should be divided by 1.5)
DecimalToHex $(($hour+14)) 1.5
DecimalToHex $minute 4  #60 minutes divided by 4 = 16 colors
DecimalToHex $minute 4
DecimalToHex $second 4
DecimalToHex $second 4
echo
fi



if [[ $hour > 6 ]]; then
echo $(date '+%Y-%m-%d %H:%M:%S')
echo 
echo -n "#"
DecimalToHex $hour 1.5   #24 minutes divided by 2  = 12 (ideally should be divided by 1.5)
DecimalToHex $hour 1.5
DecimalToHex $minute 4  #60 minutes divided by 4 = 16 colors
DecimalToHex $minute 4
DecimalToHex $second 4
DecimalToHex $second 4
echo
fi



# echo "$hour $minute $second"

# if [[ $hour == 00 || $hour == 01 ]];then
# echo $(date '+%Y-%m-%d %H:%M:%S')
# echo 
# echo "#FF11AA"
# fi