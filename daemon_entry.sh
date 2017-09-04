#!/bin/ash

echo "start daemon to create configs and kill it immediately"
deluged -c /config && sleep 3 && killall deluged

echo "create initial user"
echo "$deluser:$delpass:$lvl" >> /config/auth

echo "start daemon"
deluged -d -c /config

echo "enable reamote access"
deluge-console "config -s allow_remote True"
deluge-console "config allow_remote"

