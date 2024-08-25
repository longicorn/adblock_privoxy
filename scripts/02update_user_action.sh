#!/bin/bash

echo '{ +block{scripts, ads} }'>> /etc/privoxy/user.action
cat /hosts/my_adblock.hosts >> /etc/privoxy/user.action

wget https://hblock.molinero.dev/hosts_adblock.txt -O /tmp/hosts_adblock.txt
grep '||' /tmp/hosts_adblock.txt |sed -e 's/||//g' | sed -e 's/\^//g' >> /etc/privoxy/user.action
