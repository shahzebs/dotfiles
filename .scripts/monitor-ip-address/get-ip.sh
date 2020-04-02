#!/bin/bash

router_ip=$(lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g')

old_ip=$(cat ~/.scripts/monitor-ip-address/ip.txt)


# Check if router_ip was set to something sensible
if [ -n $router_ip ]; then
    # If IP has changed, update and send email
    if [ "$old_ip" != "$router_ip" ]; then
        echo $router_ip > ~/.scripts/monitor-ip-address/ip.txt
        echo $router_ip | /usr/bin/mail -s "[POSTFIX] New router IP address" shahzeb.syed96@gmail.com

        echo "[$(/bin/date '+%d/%m/%Y %H:%M:%S')] IP changed! IP: $router_ip" >> ~/.scripts/monitor-ip-address/history.log
    fi
else
    echo "[$(/bin/date '+%d/%m/%Y %H:%M:%S')] Unable to get router IP! Old IP: $old_ip" >> ~/.scripts/monitor-ip-address/history.log
fi

# Keep history.log 50 lines long
if [ $(< ~/.scripts/monitor-ip-address/history.log /usr/bin/wc -l) -gt 50 ]; then
    /bin/sed -i '1,2d' ~/.scripts/monitor-ip-address/history.log
fi
