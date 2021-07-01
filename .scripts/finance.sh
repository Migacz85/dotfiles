#!/usr/bin/env bash
sleep 1

ws  () {
time=2
i3-msg workspace number $1

if [ $2 == 'qute' ]
    then
    qutebrowser --target window ":later 10000 click-element id $3" "$4" &
    fi

if [ $2 == 'chrome' ]
    then
    chromium --app=$3 &
    fi

sleep $time
}


# #LAPTOP DESKTOP
# # 1 2 3 4 5

# ws 1 chrome https://docs.google.com/spreadsheets/d/1DgGgCIjHf7obCRTjHyojHxlvOxefrDI-dDbRkyRB2Dg/edit?usp=drive_web&ouid=102626394813106501735 &&
# sleep 1
# ws 2 chrome https://docs.google.com/spreadsheets/d/1b3i1HH7SDqNslAjKDvvJojzUawRelHaipJ7BAaA4oCk/edit#gid=0 &&
# ws 3 chrome https://calendar.google.com/calendar/u/0/r?pli=1
# ws 4 chrome https://coinmarketcap.com/ &&
# ws 4 chrome https://migacz85.github.io/data-visualisation/build/bitcoin.html
# ws 4 chrome https://cryptoquant.com/overview/full/474?window=day

xdotool key "Super+z"
#MONITOR DESKTOPS
# 6 7 8 9 10

ws 7 qute 15m https://www.binance.com/en/trade/BTC_USDT?type=spot
sleep 1
ws 7 qute 1h  https://www.binance.com/en/trade/BTC_USDT?type=spot
sleep 1
ws 7 qute 4h  https://www.binance.com/en/trade/BTC_USDT?type=spot
sleep 1
ws 7 qute 1d  https://www.binance.com/en/trade/BTC_USDT?type=spot

# ws 8 qute 1d  https://www.binance.com/en/trade/ETH_USDT?type=spot
# ws 8 qute 4h  https://www.binance.com/en/trade/ETH_USDT?type=spot
# ws 8 qute 1h  https://www.binance.com/en/trade/ETH_USDT?type=spot
# ws 8 qute 15m  https://www.binance.com/en/trade/ETH_USDT?type=spot

# ws 9 qute 1d  https://www.binance.com/en/trade/FIL_USDT?type=spot
# ws 9 qute 4h  https://www.binance.com/en/trade/AAVE_USDT?type=spot
# ws 9 qute 1h  https://www.binance.com/en/trade/KSM_USDT?type=spot
# ws 9 qute 15m  https://www.binance.com/en/trade/LUNA_USDT?type=spot




# ws 8 qute 4h  https://www.binance.com/en/trade/ETH_USDT?type=spot
# ws 8 qute 4h  https://www.binance.com/en/trade/BNB_USDT?type=spot
# ws 8 qute 4h  https://www.binance.com/en/trade/ADA_USDT?type=spot
# ws 8 qute 4h  https://www.binance.com/en/trade/DOT_USDT?type=spot

# ws 9 qute 4h  https://www.binance.com/en/trade/UNI_USDT?type=spot
# ws 9 qute 4h  https://www.binance.com/en/trade/BCH_USDT?type=spot
# ws 9 qute 4h  https://www.binance.com/en/trade/LINK_USDT?type=spot
# ws 9 qute 4h  https://www.binance.com/en/trade/THETA_USDT?type=spot

# ws 10 qute 4h  https://www.binance.com/en/trade/FIL_USDT?type=spot
# ws 10 qute 4h  https://www.binance.com/en/trade/AAVE_USDT?type=spot
# ws 10 qute 4h  https://www.binance.com/en/trade/KSM_USDT?type=spot
# ws 10 qute 4h  https://www.binance.com/en/trade/LUNA_USDT?type=spot



# ws 10 qute 4h  https://www.binance.com/en/trade/FIL_USDT?type=spot
# ws 10 qute 4h  https://www.binance.com/en/trade/FIL_USDT?type=spot
# ws 10 qute 4h  https://www.binance.com/en/trade/DOT_USDT?type=spot
# ws 10 qute 4h  https://www.binance.com/en/trade/UNI_USDT?type=spot


# i3-msg workspace number 7
# qutebrowser --target window ":later 10000 click-element id 15m"  https://www.binance.com/en/trade/BTC_USDT?type=spot &&
# qutebrowser --target window ":later 10000 click-element id 1h"  https://www.binance.com/en/trade/BTC_USDT?type=spot &&
# qutebrowser --target window ":later 10000 click-element id 4h"  https://www.binance.com/en/trade/BTC_USDT?type=spot &&
# qutebrowser --target window ":later 10000 click-element id 1d"  https://www.binance.com/en/trade/BTC_USDT?type=spot

# ws 8 qute 15m "https://www.binance.com/en/trade/BTC_USDT?type=spot"
# ws 8 qute 1H "https://www.binance.com/en/trade/BTC_USDT?type=spot"
# ws 8 qute 4H "https://www.binance.com/en/trade/BTC_USDT?type=spot"
# ws 8 qute 1D "https://www.binance.com/en/trade/BTC_USDT?type=spot"
# ws 9 qute "https://pro.coinbase.com/trade/BTC-USD"
