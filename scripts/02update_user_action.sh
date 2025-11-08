#!/bin/bash

echo '{ +block{scripts, ads} }'>> /etc/privoxy/user.action

rm -f /tmp/blocklist.txt
grep -v '#' /hosts/my_adblock.hosts|grep -v ^$ > /tmp/blocklist.txt

# block hosts
wget https://hblock.molinero.dev/hosts_adblock.txt -O /tmp/hosts_adblock.txt
grep '||' /tmp/hosts_adblock.txt |sed -e 's/||//g' | sed -e 's/\^//g' | grep -v bsky.app >> /tmp/blocklist.txt

wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -O /tmp/StevenBlack_hosts.txt
grep 0.0.0.0 /tmp/StevenBlack_hosts.txt |awk '{print $2}'|grep -v 0.0.0.0 >> /tmp/blocklist.txt

wget https://github.com/AdguardTeam/AdguardFilters/blob/master/JapaneseFilter/sections/adservers.txt -O /tmp/JapaneseFilteradservers.txt
grep 0.0.0.0 /tmp/JapaneseFilteradservers.txt |awk '{print $2}'|grep -v 0.0.0.0 >> /tmp/blocklist.txt

wget https://github.com/AdguardTeam/AdguardFilters/blob/master/MobileFilter/sections/adservers.txt -O /tmp/MobileFilteradservers.txt
grep 0.0.0.0 /tmp/MobileFilteradservers.txt |awk '{print $2}'|grep -v 0.0.0.0 >> /tmp/blocklist.txt

# blocklist.txt
sort /tmp/blocklist.txt | uniq >> /tmp/a; mv /tmp/a /tmp/blocklist.txt

# fix: unblocklist.txt
grep -v '#' /hosts/my_unblock.hosts|grep -v ^$ > /tmp/my_unblock.hosts
cp /tmp/blocklist.txt /tmp/blocklist2.txt
while read line; do
  grep -v $line /tmp/blocklist2.txt > /tmp/a; mv /tmp/a /tmp/blocklist2.txt
done < /tmp/my_unblock.hosts
mv /tmp/blocklist2.txt /tmp/blocklist.txt

sort /tmp/blocklist.txt | uniq >> /etc/privoxy/user.action

# cleanup
rm -f /tmp/*.log
