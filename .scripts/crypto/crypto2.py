import os, sys, requests, json, math
# from functions import  print_response, space_print, output_data, api
from functions import *
import time
import subprocess
arg1= sys.argv[1] # symbol
arg2 = sys.argv[2] # interval
limit = int(sys.argv[3])
mode = sys.argv[4] #mode


r=2 #round - how many decimals after the price
scale=1  #0.1 will take one number



if(arg1=="BTCUSDT"):
    r=1
    scale=1
    print(arg1, " ", arg2 , end =" ")
    print("".ljust(10), "O      c-o   h-o   l-o   h-l  sum  ")
else:
    r=1
    scale=1
    print(arg1, " ", arg2 , end =" ")
    print("".ljust(10), "O      c-o   h-o   l-o   h-l  sum  ")

if(mode=="n"):
    api = api(arg1, arg2, limit)
    output_data(api.data, limit, r, arg1, arg2, scale)

if(mode=="r"):
    while 1>0:
        r=2

        apic=api(arg1,"15m", limit)
        apic1=api(arg1,"1h", limit)
        apic2=api(arg1,"4h", limit)
        apic3=api(arg1,"1d", limit)
        apic4=api(arg1,"1w", limit)


        # os.system('clear')
        subprocess.run(["clear"])
        # print("".ljust(27), "O      c-o   h-o      l-o   h-l  sum  ")
        print("".ljust(27), "O      uptail  body   downtail   ")

        # output_data(apic4.data, limit, r, arg1, "1w", scale)
        # print("\n")
        output_data(apic3.data, limit, r, arg1, "1d", scale)
        print("\n")
        output_data(apic2.data, limit, r, arg1, "4h", scale)
        print("\n")
        output_data(apic1.data, limit, r, arg1, "1h", scale)
        print("\n")
        output_data(apic.data, limit, r, arg1, "15", scale)
        print("api_usage:", apic.usage, "api_usage1m:", apic.usage1m, "\n")


        time.sleep( 1 )


# print("Cumulative o-c", round(oc,r))

# Output
# [
#   [
#     1499040000000,      // Open time
#     "0.01634790",       // Open
#     "0.80000000",       // High
#     "0.01575800",       // Low
#     "0.01577100",       // Close
#     "148976.11427815",  // Volume
#     1499644799999,      // Close time
#     "2434.19055334",    // Quote asset volume
#     308,                // Number of trades
#     "1756.87402397",    // Taker buy base asset volume
##      "28.46694368",      // Taker buy quote asset v# olume
#     "17928899.62484339" // Ignore
#   ]
# ]
