#!/usr/bin/env python3
from datetime import datetime
import requests
import statistics

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    RED = '\033[31m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

class apiCall:
    def __init__(self, arg1, arg2, limit):

        url = 'https://api.binance.com/api/v1/klines'
        url2= 'https://api.binance.com/api/v1/exchangeInfo'

        params = {
        'symbol': arg1,
        'interval': arg2,
        'limit': limit
        }

        response = requests.Session().get(url, params=params)

        self.response = response
        self.statusCode = response.status_code
        self.usage1m = response.headers['x-mbx-used-weight-1m']
        self.usage = response.headers['x-mbx-used-weight']
        self.exchange_info = 0 #requests.get(url2).json()
        self.data=response.json()

# This function returns an object of apiCall
def api(arg1, arg2, limit):
    return apiCall(arg1, arg2, limit)


def stop_on_api_limit(arg1):
    #test
    # api_call['response'].headers['x-mbx-used-weight']=1200
    if (int(arg1.headers['x-mbx-used-weight'])>1100):
        print('You exceeded "limit for binance API used-weight" ')
        exit()

def output_data(data, limit, r, arg1, arg2, scale):
    oc_red=[]
    oc_green=[]
    for dic in data[-limit:]:
        print("")
        # adjustutc=3600000
        adjustutc=0
        print(datetime.utcfromtimestamp((dic[0]+adjustutc)/1000).strftime('%Y-%m-%d %H:%M %a'),arg2,  end="  |  ")

        h=round(float(dic[2]),r)
        o=round(float(dic[1]),r)
        c=round(float(dic[4]),r)
        l=round(float(dic[3]),r)
        v=round(float(dic[5])/1,r)
        t=round(int(dic[8])/1 ,r) #number of trades

        col_width=1

        # OHLC
        # space_print(h, arg1, scale)
        if ( o>c ):
            space_print(o, arg1, scale, r, bcolors.RED )
            # space_print(c, arg1, scale, bcolors.RED)
        else:
            space_print(o, arg1, scale, r )
            # space_print(c, arg1, scale )
        # space_print(l, arg1, scale)

        #CALCULATED FILEDS

        # #close-open
        # space_print(c-o, arg1, scale)
        # #high-open
        # space_print(h-o, arg1, scale)
        # #high-open
        # space_print(l-o, arg1, scale)

        #high-low
        # space_print(round(h-l,r), arg1, scale)
        #sum of c-o
        # oc+=c-o
        # space_print(oc, arg1, scale)

        # Candle- body, uptail, downtail
        # uptail
        if c-o<0:
            uptail=o-h
        else:
            uptail=c-h
        #downtail
        if c-o<0:
            downtail=c-l
        else:
            downtail=o-l

        space_print(uptail, arg1, scale, r)
        space_print(c-o, arg1, scale, r)
        space_print(downtail, arg1, scale, r)


        #Median
        if c-o<0:
            oc_red.append(c-o)
        else:
            oc_green.append(c-o)

        # #hammers
        # if c-o<0:
        #     if abs(c-o)*2<abs(o-h) and abs(c-o)>abs(c-l) :
        #         space_print(10 , arg1, scale)
        # else:
        #     if abs(c-o)*2<abs(o-l) and abs(c-o)<abs(o-l) :
        #         space_print(20 , arg1, scale)
        # space_print(MMoc, arg1, scale, bcolors.RED)

        #VOLUME
        print('|V ', end="  ")
        space_print(v, arg1, scale, r)
        space_print(t, arg1, scale, r)
        print('T| ', end="  ")

    print("\n")
    if len(oc_red)>0:
        print("Avg red candle c-o=", round((statistics.mean(oc_red)),2), end=" " )
    if len(oc_green)>0:
        print("Avg green candle c-o=", round((statistics.mean(oc_green)),2), end="")
        print("red/green=", (len(oc_green)/(len(oc_green)+len(oc_red))) , end = " ")

def space_print(x, arg1, scale, r,  color=bcolors.OKCYAN):

    adjust=10
    # if(o>c):
    #
    if(x<0):
        cs=bcolors.RED
        ce=bcolors.ENDC
    else:
        cs=color
        ce=bcolors.ENDC

    if(arg1=="BTCUSDT"):
        adjust=7
        x=str(int(x*scale))
    else:
        x=round(x*scale,r)
        x=str(x)

    print(cs+x.ljust(adjust," ")+ce, end="")
