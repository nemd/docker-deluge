#!/bin/ash

echo "start daemon to create configs and kill it immediately"
deluged -d -c /config
killall deluged

echo "create initial user"
echo "$deluser:$delpass:$lvl" >> /config/deluge/auth

echo "enable reamote access"
deluge-console "config -s allow_remote True"
deluge-console "config allow_remote"

echo "start daemon"
deluged -d -c /config