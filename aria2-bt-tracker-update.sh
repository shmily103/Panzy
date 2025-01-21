#!/bin/bash
wget https://ngosang.github.io/trackerslist/trackers_all.txt -O /tmp/best_aria2.txt
[ -s /tmp/best_aria2.txt ] || exit 0 
tmp=$(cat /tmp/best_aria2.txt | sed ':a;N;$!ba;s/\n/,/g;s/^,//')

uci set aria2.main.bt_tracker=$tmp
uci commit aria2
/etc/init.d/aria2 restart
