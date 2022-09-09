#!/usr/bin/env bash

sleep_time=2

qjackctl            &

sleep $sleep_time   
cadence             &
sleep $sleep_time   
obs                 & 

sleep $sleep_time   
i3-msg workspace 2
bitwig-studio       &

sleep $sleep_time   
iriunwebcam         &
aleep $sleep_time   
cam                 &
