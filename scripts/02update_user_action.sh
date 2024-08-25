#!/bin/bash

echo '{ +block{scripts, ads} }'>> /etc/privoxy/user.action

rm -f /tmp/blocklist.txt
cat /hosts/my_adblock.hosts > /tmp/blocklist.txt

wget https://hblock.molinero.dev/hosts_adblock.txt -O /tmp/hosts_adblock.txt
grep '||' /tmp/hosts_adblock.txt |sed -e 's/||//g' | sed -e 's/\^//g' >> /tmp/blocklist.txt

wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -O /tmp/StevenBlack_hosts.txt
grep 0.0.0.0 /tmp/StevenBlack_hosts.txt |awk '{print $2}'|grep -v 0.0.0.0 >> /tmp/blocklist.txt

sort /tmp/blocklist.txt | uniq >> /etc/privoxy/user.action
