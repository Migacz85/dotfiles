#!/bin/bash
# Credit to David Walsh for the original script <https://davidwalsh.name/bitcoin>
clear
echo "Coindesk BTC: "
echo "Time       USD             EUR            "

while [ 1 ] 
do
    d=$(date)
    curl -s http://api.coindesk.com/v1/bpi/currentprice.json |  python -c "

#Python code:
import json, sys
from datetime import datetime 
bitcoin=json.load(sys.stdin) 
btc_usd=bitcoin['bpi']['USD']['rate'] 
btc_eur=bitcoin['bpi']['EUR']['rate'] 
holding=bitcoin['bpi']['USD']['rate']
print(datetime.now().strftime('%H:%M:%M') ,' ', btc_usd + '\t' + btc_eur + '\t' )
"
# printf "\033[A" 
sleep 30
done
