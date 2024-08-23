#!/bin/bash

wget https://raw.github.com/Andrwe/privoxy-blocklist/master/privoxy-blocklist.sh -O /etc/privoxy/privoxy-blocklist.sh
sed -e 's/\/etc\/privoxy-blocklist.conf/\/etc\/privoxy\/privoxy-blocklist.conf/' /etc/privoxy/privoxy-blocklist.sh > /tmp/a
mv /tmp/a /etc/privoxy/privoxy-blocklist.sh
chmod +x /etc/privoxy/privoxy-blocklist.sh
/etc/privoxy/privoxy-blocklist.sh

wget https://raw.githubusercontent.com/skroll/privoxy-adblock/master/privoxy-adblock.sh -O /etc/privoxy/privoxy-adblock.sh
chmod +x /etc/privoxy/privoxy-adblock.sh
/etc/privoxy/privoxy-adblock.sh -p /etc/privoxy -u http://tofukko.r.ribbon.to/Adblock_Plus_list.txt -u https://raw.githubusercontent.com/k2jp/abp-japanese-filters/master/abpjf.txt
