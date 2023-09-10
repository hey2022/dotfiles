#!/bin/sh

PID=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true).pid');
kill -9 $PID;
