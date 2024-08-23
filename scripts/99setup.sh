#!/bin/bash

echo '------------'
echo 'setup /etc/privoxy/config'
echo '------------'

echo 'actionsfile Adblock_Plus_list.script.action' >> /etc/privoxy/config
echo 'actionsfile abpjf.script.action' >> /etc/privoxy/config
echo 'actionsfile easylist.script.action' >> /etc/privoxy/config

echo 'filterfile Adblock_Plus_list.script.filter' >> /etc/privoxy/config
echo 'filterfile abpjf.script.filter' >> /etc/privoxy/config
echo 'filterfile easylist.script.filter' >> /etc/privoxy/config
