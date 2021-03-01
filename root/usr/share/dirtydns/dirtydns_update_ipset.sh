#!/bin/sh -e
set -o pipefail

[ -d /etc/dirtydns ] || mkdir /etc/dirtydns
wget https://pexcn.me/daily/chnroute/chnroute.txt -O /tmp/chnroute.txt.tmp
mv -f /tmp/chnroute.txt.tmp /etc/dirtydns/chnroute.txt

/etc/init.d/dirtydns restart