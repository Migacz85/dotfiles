#!/bin/bash
bash firefox -url "data:text/html;charset=utf-8,<!DOCTYPE html><html><body><script>window.open('$1', '_blank','height=400,width=600,menubar=no,location=no,toolbar=no,left=100,top=100')<%2Fscript><%2Fbody><%2Fhtml>"
sleep 1

