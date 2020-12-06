#!/usr/bin/env bash

# chromium --app=https://www.binance.com/en/trade/BTC_TUSD & 
# sleep 0.5
# chromium --app=https://pro.coinbase.com/trade/BTC-USD & 
# sleep 0.5
# chromium --app=https://docs.google.com/spreadsheets/d/1DgGgCIjHf7obCRTjHyojHxlvOxefrDI-dDbRkyRB2Dg/edit#gid=1280068297 &
# chromium --app=https://pro.coinbase.com/trade/BTC-USD & 
time=1

chromium --app=https://www.binance.com/en/trade/BTC_TUSD

sleep $time
chromium --app=https://www.binance.com/en/trade/BCH_TUSD

sleep $time
chromium --app=https://docs.google.com/spreadsheets/d/1DgGgCIjHf7obCRTjHyojHxlvOxefrDI-dDbRkyRB2Dg/edit?usp=drive_web&ouid=102626394813106501735

sleep $time
chromium --app=https://docs.google.com/spreadsheets/d/1b3i1HH7SDqNslAjKDvvJojzUawRelHaipJ7BAaA4oCk/edit#gid=0
