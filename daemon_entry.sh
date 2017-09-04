#!/bin/ash

echo "start daemon to create configs and kill it immediately"
deluged -c /config && sleep 3 && killall deluged

echo "create initial user"
echo "$deluser:$delpass:$lvl" >> /config/auth

echo "enable remote access"
sed -i '/allow_remote/ s/false/true/' /config/core.conf

echo "start daemon"
deluged -d -c /config